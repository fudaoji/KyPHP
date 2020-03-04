<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <fudaoji@gmail.com>
// +----------------------------------------------------------------------

/**
 * Created by PhpStorm.
 * Script Name: ${FILE_NAME}
 * Create: 2020/2/29 下午11:37
 * Description: 
 * Author: Doogie<461960962@qq.com>
 */

namespace ky;
use think\Db;
use think\Model;

class BaseModel extends Model
{
    /**
     * 默认主键
     * @var string
     */
    protected $pk = 'id';
    /**
     * 数据表
     * @var string
     */
    //protected static $table = '';
    protected $autoWriteTimestamp = true;
    // 创建时间字段,无填null
    protected $createTime = 'create_time';
    // 更新时间字段,无填null
    protected $updateTime = 'update_time';

    /**
     * 是否缓存
     * @var bool
     */
    protected $isCache = false;
    /**
     * 缓存时间
     * @var int
     */
    protected $expire = 3600;
    /**
     * 水平分表规则
     * @var array
     */
    protected $rule = [];
    /**
     * 分表字段
     * @var string
     */
    protected $key = '';

    /**
     * 查询某个时间段的count统计
     * @param array $params
     * @return mixed
     * @Author  Doogie<461960962@qq.com>
     */
    public function totalByTime($params = []){
        if(empty($params['timeFields']) || !is_array($params['timeFields'])){
            exception('timeFields数据格式错误', 10006);
        }

        $where = empty($params['where']) ? [] : $params['where'];
        $refresh = empty($params['refresh']) ? 0 : $params['refresh'];

        $cache_key = md5(config('database.hostname') . config('database.database') . $this->getTrueTable($where) . 'totalByTime' . serialize($where) . serialize($params['timeFields']));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where);
        $this->_where($selector, $where);
        foreach($params['timeFields'] as $item){
            $this->whereTime($item[0], $item[1]);
        }
        if($this->isCache){
            $selector->cache($cache_key, $this->expire, $this->getTrueTable($where));
        }
        $data = $selector->count();
        return $data;
    }

    /**
     * 根据主键获取单个数据
     * @param int $pk
     * @param int $refresh
     * @return mixed
     * @Author  Doogie<461960962@qq.com>
     */
    public function getOne($pk = 0, $refresh = 0){
        $id = $this->getId($pk);
        $cache_key = md5(config('database.hostname') . config('database.database') . $this->getTrueTable($pk) . $id);
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($pk)->field(true);

        if($this->isCache){
            $selector->cache($cache_key, $this->expire, $this->getTrueTable($pk));
        }
        $data = $selector->find($id);
        unset($cache_key);
        return $data;
    }

    /**
     * 新增单条数据
     * @param array $data
     * @return bool|mixed
     * @throws \think\Exception
     * @Author  Doogie<461960962@qq.com>
     */
    public function addOne($data = []){
        if($this->autoWriteTimestamp){
            $this->createTime && empty($data[$this->createTime]) && $data[$this->createTime] = time();
            $this->updateTime && empty($data[$this->updateTime]) && $data[$this->updateTime] = time();
        }
        $res = $this->getBuilder($data)->insert($data);
        if($res){
            if(empty($data[$this->pk])){
                $res = $this->getBuilder($data)->getLastInsID(); //坑爹只能返回自增ID
            }else{
                $res = $data[$this->pk];
            }
            $pk = $this->key ? [$this->key=>$data[$this->key], $this->pk => $res] : $res;
            $insert_data = $this->getOne($pk);
            return $insert_data;
        }
        return false;
    }

    /**
     * 批量添加
     * @param array $arr
     * @return bool
     * @Author: fudaoji<fdj@kuryun.cn>
     */
    public function addBatch($arr = []){
        $count = 0;
        foreach($arr as $data){
            $this->addOne($data) && $count++;
        }
        return $count == count($arr);
    }

    /**
     * 更新单条数据
     * @param array $data
     * @return bool|mixed
     * @Author  fudaoji<fdj@kuryun.cn>
     */
    public function updateOne($data = []){
        if(!isset($data[$this->pk])){
            return false;
        }
        if($this->autoWriteTimestamp){
            $this->updateTime && empty($data[$this->updateTime]) && $data[$this->updateTime] = time();
        }
        $res = $this->getBuilder($data)->update($data);
        if($res){
            $pk = $this->key ? [$this->key=>$data[$this->key], $this->pk => $data[$this->pk]] : $data[$this->pk];
            $new = $this->getOne($pk, 1);
            return $new;
        }
        return false;
    }

    /**
     * 根据条件更新单条数据
     * @param array $where
     * @param array $data
     * @return bool|mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function updateByMap($where = [], $data = []){
        if(!isset($data[$this->pk])){
            return false;
        }
        if($this->autoWriteTimestamp){
            $this->updateTime && empty($data[$this->updateTime]) && $data[$this->updateTime] = time();
        }
        $selector = $this->getBuilder($where);
        $selector->_where($selector, $where);
        $res = $selector->update($data);
        if($res){
            $pk = $this->key ? [$this->key=>$where[$this->key], $this->pk => $where[$this->pk]] : $where[$this->pk];
            $new = $this->getOne($pk, 1);
            return $new;
        }
        return false;
    }

    /**
     * 批量修改数据
     * @param $arr
     * @return bool
     */
    public function updateBatch($arr){
        $count = 0;
        foreach($arr as $data){
            $this->updateOne($data) && $count++;
        }
        return $count == count($arr);
    }

    /**
     * 根据主键删除单个数据
     * @param $pk
     * @return bool
     */
    public function delOne($pk=0){
        $id = $this->getId($pk);
        if($this->getBuilder($pk)->delete($id)){
            if($this->isCache){
                $cache_key = md5(config('database.hostname') . config('database.database') . $this->getTrueTable($pk) . $id);
                cache($cache_key, null);
            }
            return true;
        }
        return false;
    }

    /**
     * 批量删除
     * @param $pk_arr
     * @return bool
     */
    public function delBatch($pk_arr=[]){
        $pk_arr = array_unique($pk_arr);
        $count = 0;
        foreach($pk_arr as $id){
            $this->delOne($id) && $count++;
        }
        return $count == count($pk_arr);
    }

    /**
     * 自带的分页
     * @param $where
     * @param $order
     * @param $page_size
     * @param mixed $field
     * @param $refresh
     * @return mixed
     * @auth Doogie<461960962@qq.com>
     */
    public function page($page_size=10, $where=[], $order=[], $field = true, $refresh=0){
        $current_page = isset($_GET['page']) ? $_GET['page'] : 1;
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::' .$current_page.':'. $page_size . ':' . serialize($where) . ':' . serialize($order);
        $refresh && cache($cache_key, null);
        $data = cache($cache_key);
        if(empty($data)){
            //不知什么原因，无法使用数据查询缓存 -cache()
            $selector = $this->getBuilder($where)->field($field);
            $this->_where($selector, $where);
            $data = $selector->order($order)->paginate($page_size);
            $this->isCache && cache($cache_key, $data,$this->expire);
        }
        return $data;
    }

    /**
     * 获取分页数据
     * @param array $limit
     * @param array $where
     * @param array $order
     * @param bool|true $field
     * @param int $refresh
     * @return mixed
     * @Author  Doogie<461960962@qq.com>
     */
    public function getList($limit = [], $where = [], $order = [], $field = true, $refresh = 0){
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::' . serialize($limit) . ':' . serialize($where) . ':' . serialize($order);
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where)->field($field);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        $this->_where($selector, $where);
        $data = $selector->order($order)->page($limit[0], $limit[1])->select();
        return $data;
    }

    /**
     * count统计
     * @param array $where
     * @param int $refresh
     * @return mixed
     * @Author  Doogie<461960962@qq.com>
     */
    public function total($where = [], $refresh = 0){
        $cache_key = md5(config('database.hostname') . config('database.database') . $this->getTrueTable($where) . 'total' . serialize($where));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where);
        $this->_where($selector, $where);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire, $this->getTrueTable($where));
        }
        $data = $selector->count();
        return $data;
    }

    /**
     * 获取字段
     * @param string $field
     * @param array $query
     * @param int $refresh
     * @return array
     * @Author  Doogie<461960962@qq.com>
     */
    public function getField($field = '', $query = [],$refresh = 0){
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($query) . '::getfield:' . serialize($field).':'.serialize($query);
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($query);
        $this->_where($selector, $query);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        $data = $selector->column($field);
        return $data;
    }

    /**
     * 条件链接器
     * @param $self
     * @param array $where 两种情况[id=>1]或[[id=>1], ['name' => ['like', '%ddd%']]]
     * @Author: Doogie <461960962@qq.com>
     */
    private function _where(&$self, $where=[]){
        if($where){
            foreach($where as $k => $w){
                if(! is_int($k)){
                    $self->where($where);
                    break;
                }
                $self->where($w);
            }
        }
        return $self;
    }

    /**
     * 根据条件获取数据
     * @param array $where
     * @param $field
     * @param int $refresh
     * @return array|false|\PDOStatement|string|Model
     * @throws \think\exception\DbException
     * @Author: fudaoji <fdj@kuryun.cn>
     */
    public function getOneByMap($where=[], $field = true, $refresh = 0){
        $cache_key = md5(config('database.hostname') . config('database.database') . $this->getTrueTable($where) . 'getonebymap' . serialize($where));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where)->field($field);
        $this->_where($selector, $where);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire, $this->getTrueTable($where));
        }
        $data = $selector->find();
        return $data;
    }

    /**
     * 获取builder,兼容分表
     * @param array $query
     * @return $this|\think\db\Query
     * @Author: Doogie <461960962@qq.com>
     */
    public function getBuilder($query = []){
        if($this->rule && $this->key){
            return Db::table($this->getTable())->partition([$this->key => $query[$this->key]], $this->key, $this->rule);
        }else{
            return Db::table($this->getTable());
        }
    }

    /**
     * 获取真正的表名
     * @param array $query
     * @return mixed
     * @Author: Doogie <461960962@qq.com>
     */
    public function getTrueTable($query = []){
        if($this->key && !empty($query[$this->key])){
            return Db::table($this->getTable())->getPartitionTableName([$this->key => $query[$this->key]], $this->key, $this->rule);
        }else{
            return $this->getTable();
        }
    }

    /**
     * 获取真实id值
     * @param array $query
     * @return array
     * @Author: Doogie <461960962@qq.com>
     */
    public function getId($query = []){
        if($this->key && !empty($query[$this->key])){
            return $query[$this->pk];
        }else{
            return $query;
        }
    }

    /**
     * 根据条件获取数据
     * @param array $params
     * @return mixed
     * @author: Doogie<461960962@qq.com>
     */
    public function getAll($params){
        $where = empty($params['where']) ? [] : $params['where'];
        $order = empty($params['order']) ? [] : $params['order'];
        $field = empty($params['field']) ? true : $params['field'];
        $refresh = empty($params['refresh']) ? 0 : $params['refresh'];
        $cache_key = md5(config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::getall' . ':' . serialize($where) . ':' . serialize($order));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where)->field($field);
        $this->_where($selector, $where);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire, $this->getTrueTable($where));
        }
        $data = $selector->order($order)->select();
        return $data;
    }

    /**
     * 自增或自减一个字段的值
     * @param int $type 1自增 2自减
     * @param array $where 查询条件
     * @param array $data [字段, 数字]
     * @param int $expire 延迟执行时间
     * @return array|false|\PDOStatement|string|Model
     * @author: Doogie<461960962@qq.com>
     */
    public function setIncDec($type = 1,$where = [],$data = [], $expire = 0){
        $selector = $this->getBuilder($where);
        $this->_where($selector, $where);
        $func = $type == 1 ? 'setInc' : 'setDec';
        return $selector->$func($data[0], $data[1], $expire);
    }

    /**
     *根据某个字段不重复获取数据
     * @param string $field 字段
     * @param array $where
     * @param int $refresh
     * @return mixed
     * @Author  Doogie<461960962@qq.com>
     */
    public function distinctField($field = '', $where = [], $refresh = 0){
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::distinctfield' . ':' . $field . ':' . serialize($where);
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where);
        $this->_where($selector, $where);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        $data = $selector->distinct(true)->column($field);
        return $data;
    }

    /**
     * 获取group by结果列表
     * @param string $group_field  分组字段
     * @param bool $field  需要查询字段
     * @param array $limit 分页参数
     * @param array $where 查询条件
     * @param array $order  排序规则
     * @param string $having  聚合条件
     * @param int $refresh  是否刷新缓存
     * @return mixed
     * @author: Doogie<461960962@qq.com>
     */
    public function getGroupList($group_field, $field = true, $limit = [], $where = [], $order = [], $having='', $refresh = 0){
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::' . serialize($group_field) . ':' . serialize($field).':' . serialize($limit) . ':' . serialize($where) . ':' . serialize($order) . serialize($having);
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where)->field($field);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        if($having){
            $selector->having($having);
        }
        $this->_where($selector, $where);
        $data = $selector->group($group_field)->order($order)->page($limit[0], $limit[1])->select();
        return $data;
    }

    /**
     * sum求和
     * @param string $field
     * @param array $where
     * @param int $refresh
     * @return int $data
     * @author Jason<1589856452@qq.com>
     */
    public function sums($field = '', $where = [], $refresh = 0) {
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::sums' . ':' . $field . ':' . serialize($where);
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where);
        $this->_where($selector, $where);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        $data = $selector->sum($field);

        return $data;
    }

    /**
     * 获取有联合查询的分页数据
     * @param array $params
     * @return mixed
     * e.g: model('activity')->getListJoin([
    'alias' => 'a',
    'join' => [[config('database.prefix').'user u', 'a.user_id=u.id', 'left']],
    'limit' => [1, 100],
    'where' => ['a.id' => ['gt', 300]],
    'field' => 'u.username,a.id as activity_id',
    'order' => ['a.id' => 'desc']
    ]);
     * @Author  Doogie<461960962@qq.com>
     */
    public function getListJoin($params = []){
        $limit = $params['limit'];
        $where = empty($params['where']) ? [] : $params['where'];
        $order = empty($params['order']) ? [] : $params['order'];
        $field = empty($params['field']) ? true : $params['field'];
        $refresh = empty($params['refresh']) ? 0 : $params['refresh'];
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::' . md5(serialize($params));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where)->field($field);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        if(!empty($params['alias'])){
            $selector->alias($params['alias']);
        }
        if(!empty($params['join'])){
            $selector->join($params['join']);
        }
        $this->_where($selector, $where);
        $data = $selector->order($order)->page($limit[0], $limit[1])->select();
        return $data;
    }

    /**
     * 获取关联查询所有数据
     * @param array $params
     * @return mixed
     * e.g: model('activity')->getAllJoin([
    'alias' => 'a',
    'join' => [[config('database.prefix').'user u', 'a.user_id=u.id', 'left']],
    'where' => ['a.id' => ['gt', 300]],
    'field' => 'u.username,a.id as activity_id',
    'order' => ['a.id' => 'desc']
    ]);
     * @author Jason<dcq@kuryun.cn>
     */
    public function getAllJoin($params = []){
        $where = empty($params['where']) ? [] : $params['where'];
        $order = empty($params['order']) ? [] : $params['order'];
        $field = empty($params['field']) ? true : $params['field'];
        $refresh = empty($params['refresh']) ? 0 : $params['refresh'];
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::' . md5(serialize($params));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where)->field($field);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        if(!empty($params['alias'])){
            $selector->alias($params['alias']);
        }
        if(!empty($params['join'])){
            $selector->join($params['join']);
        }
        $this->_where($selector, $where);
        $data = $selector->order($order)->select();
        return $data;
    }

    /**
     * 获取多表关联统计数据
     * @param array $params
     * @return mixed
     * e.g: model('activity')->totalJoin([
    'alias' => 'a',
    'join' => [[config('database.prefix').'user u', 'a.user_id=u.id', 'left']],
    'where' => ['a.id' => ['gt', 300]]
    ]);
     * @author Jason<dcq@kuryun.cn>
     */
    public function totalJoin($params = []){
        $where = empty($params['where']) ? [] : $params['where'];
        $refresh = empty($params['refresh']) ? 0 : $params['refresh'];
        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::totalJoin' . md5(serialize($params));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        if(!empty($params['alias'])){
            $selector->alias($params['alias']);
        }
        if(!empty($params['join'])){
            $selector->join($params['join']);
        }
        $this->_where($selector, $where);
        $data = $selector->count();
        return $data;
    }

    /**
     * 获取有联合查询的分页数据
     * @param array $params
     * @return mixed
     * e.g: model('activity')->pageJoin([
    'alias' => 'a',
    'join' => [[config('database.prefix').'user u', 'a.user_id=u.id', 'left']],
    'page_size' => 20,
    'where' => ['a.id' => ['gt', 300]],
    'field' => 'u.username,a.id as activity_id',
    'order' => ['a.id' => 'desc']
    ]);
     * @Author  Doogie<461960962@qq.com>
     */
    public function pageJoin($params = []){
        $page_size = $params['page_size'];
        $where = empty($params['where']) ? [] : $params['where'];
        $order = empty($params['order']) ? [] : $params['order'];
        $field = empty($params['field']) ? true : $params['field'];
        $refresh = empty($params['refresh']) ? 0 : $params['refresh'];
        $cache_key = md5(config('database.hostname') . config('database.database') . $this->getTrueTable($where) . serialize($params));
        $refresh && cache($cache_key, null);
        $selector = $this->getBuilder($where)->field($field);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire, $this->getTrueTable($where));
        }
        if(!empty($params['alias'])){
            $selector->alias($params['alias']);
        }
        if(!empty($params['join'])){
            $selector->join($params['join']);
        }
        $this->_where($selector, $where);
        $data = $selector->order($order)->paginate($page_size);
        return $data;
    }

    /**
     * 获取group by结果
     * @param array $params 参数
     * @return mixed
     * @author: Doogie<461960962@qq.com>
     */
    public function getGroupAll($params = []){
        $refresh = empty($params['refresh']) ? 0 : $params['refresh'];
        $field = empty($params['field']) ? true : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $order = empty($params['order']) ? [] : $params['order'];
        $having = empty($params['having']) ? '' : $params['having'];
        $group_field = empty($params['group']) ? '' : $params['group'];

        $cache_key = config('database.hostname') . config('database.database') . $this->getTrueTable($where) . '::' . md5(serialize($params));
        $refresh && cache($cache_key, null);

        $selector = $this->getBuilder($where)->field($field);
        if($this->isCache){
            $selector->cache($cache_key, $this->expire);
        }
        if($having){
            $selector->having($having);
        }
        $this->_where($selector, $where);
        $data = $selector->group($group_field)->order($order)->select();
        return $data;
    }
}
