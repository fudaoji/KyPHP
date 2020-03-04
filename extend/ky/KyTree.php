<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------
/**
 * Created by PhpStorm.
 * Script Name: ${FILE_NAME}
 * Create: 2020/3/1 17:07
 * Description: 
 * Author: fudaoji<fdj@kuryun.cn>
 */

namespace ky;
class KyTree
{
    private static $primary = 'id';
    private static $parentId = 'pid';
    private static $child = 'child';

    public static function makeTree(&$data, $index = 0)
    {
        $childs = self::findChild($data, $index);
        if (empty($childs)) {
            return $childs;
        }
        foreach ($childs as $k => &$v) {
            if (empty($data)) break;
            $child = self::makeTree($data, $v[self::$primary]);
            if (!empty($child)) {
                $v[self::$child] = $child;
            }
        }
        unset($v);
        return $childs;
    }

    public static function findChild(&$data, $index)
    {
        $childs = [];
        foreach ($data as $k => $v) {
            if ($v[self::$parentId] == $index) {
                $childs[] = $v;
                unset($v);
            }
        }
        return $childs;
    }

    public static function getTreeNoFindChild($data)
    {
        $map = [];
        $tree = [];
        foreach ($data as &$it) {
            $map[$it[self::$primary]] = &$it;
        }
        foreach ($data as $key => &$it) {
            $parent = &$map[$it[self::$parentId]];
            if ($parent) {
                $parent['child'][] = &$it;
            } else {
                $tree[] = &$it;
                //$tree[]['child'] = null;
            }
        }
        return $tree;
    }

    public static function getParents($data, $catId)
    {
        $tree = array();
        foreach ($data as $item) {
            if ($item[self::$primary] == $catId) {
                if ($item[self::$parentId] > 0)
                    $tree = array_merge($tree, self::getParents($data, $item[self::$parentId]));
                $tree[] = $item;
                break;
            }
        }
        return $tree;
    }

    /**
     * 将树还原成列表
     * @param $tree
     * @param string $child
     * @param string $order
     * @param array $list
     * @return array|mixed
     * Author: fudaoji<fdj@kuryun.cn>
     */
    public static function tree2List($tree, $child = '', $order = '', &$list = [])
    {
        if(empty($child)){
            $child = self::$child;
        }
        if(empty($order)){
            $order = self::$primary;
        }
        if (is_array($tree)) {
            $refer = array();
            foreach ($tree as $key => $value) {
                $reffer = $value;
                if (isset($reffer[$child])) {
                    if ($reffer[$child] == null) {

                    } else {
                        dump($value);exit;
                        unset($reffer[$child]);
                        self::tree2List($value[$child], $child, $order, $list);
                    }

                }
                $list[] = $reffer;
            }
            $list = self::listSortBy($list, $order, 'asc');
        }
        return $list;
    }

    /**
     * 对查询结果集进行排序
     * @access public
     * @param array $list 查询结果
     * @param string $field 排序的字段名
     * @param string $sort 排序类型
     * asc正向排序 desc逆向排序 nat自然排序
     * @return mixed
     */
    public static function listSortBy($list, $field, $sort = 'asc')
    {
        if (is_array($list)) {
            $refer = $resultSet = array();
            foreach ($list as $i => $data)
                $refer[$i] = &$data[$field];
            switch ($sort) {
                case 'asc': // 正向排序
                    asort($refer);
                    break;
                case 'desc':// 逆向排序
                    arsort($refer);
                    break;
                case 'nat': // 自然排序
                    natcasesort($refer);
                    break;
            }
            foreach ($refer as $key => $val)
                $resultSet[] = &$list[$key];
            return $resultSet;
        }
        return false;
    }
}