<?php
// +----------------------------------------------------------------------
// | [KyPHP System] Copyright (c) 2020 http://www.kuryun.com/
// +----------------------------------------------------------------------
// | [KyPHP] 并不是自由软件,你可免费使用,未经许可不能去掉KyPHP相关版权
// +----------------------------------------------------------------------
// | Author: fudaoji <461960962@qq.com>
// +----------------------------------------------------------------------


namespace app\mini\controller;

class App extends Base
{

    private $addonCfByDb;
    private $addonCfByFile;
    private $addonName;
    /**
     * @var \app\common\model\Addons
     */
    private $addonM;
    /**
     * @var \app\common\model\MiniAddon
     */
    private $miniAddonM;
    /**
     * @var \app\common\model\AdminAddon
     */
    private $adminAddonM;

    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->addonM = model('addons');
        $this->miniAddonM = model('miniAddon');
        $this->adminAddonM = model('adminAddon');
        $this->checkAddon();
    }

    /**
     * 验证插件及插件信息
     * @author: fudaoji<fdj@kuryun.cn>
     */
    private function checkAddon(){
        $name = $this->addonName = input('name', '');
        $addon_db = $this->addonM->getOneByMap(['addon' => $name, 'status' => 1], true, 1);
        if (empty($addon_db)) {
            $this->error('应用不存在或已下架');
        }
        if(! $this->adminAddonM->total(['addon' => $name, 'uid' => $this->adminId, 'deadline' => ['gt', time()]], 1)){
            $this->error('请先开通或续费此应用');
        }
        if(! $this->miniAddonM->total(['addon' => $name, 'mini_id' => $this->miniId], 1)){
            $this->miniAddonM->addOne(['addon' => $name, 'mini_id' => $this->miniId]);
        }
        $this->addonCfByDb = $addon_db;

        $addon_local = $this->addonM->getAddonConfigByFile($name);
        if($addon_local === false){
            $this->error('本地不存在该应用');
        }
        $this->addonCfByFile = $addon_local;

        if ($addon_db['addon'] != $addon_local['addon']) {
            $this->error('应用信息不相符，请检查');
        }
        //插件的管理菜单
        $addon_menu = isset($addon_local['menu']) ? $addon_local['menu'] : '';
        $node = input('node', '');
        if (!empty($addon_menu) && is_array($addon_menu)) {
            foreach ($addon_menu as $key => $val) {
                $addon_menu[$key]['show'] = 0;
                $addon_menu[$key]['url'] = str_replace('/', '-', $val['url']);
                if ($node == $addon_menu[$key]['url'] && !empty($node)) {
                    $addon_menu[$key]['show'] = 1;
                }
                //是否有二级菜单
                if (isset($val['child']) && !empty($val['child']) && is_array($val['child'])) {
                    foreach ($val['child'] as $k => $v) {
                        $addon_menu[$key]['child'][$k]['url'] = str_replace('/', '-', $v['url']);
                        $addon_menu[$key]['child'][$k]['show'] = 0;
                        if ($node == $addon_menu[$key]['child'][$k]['url']) {
                            $addon_menu[$key]['child'][$k]['show'] = 1;
                            $addon_menu[$key]['show'] = 1;
                        }
                    }
                }
            }
        }

        $is_show_config_menu = false;
        if (!empty($addon_local['config']) || (isset($addon_local['is_theme']) && $addon_local['is_theme'] == true)
        ) {
            $is_show_config_menu = true;
        }

        $assign = [
            'isShowConfigMenu' => $is_show_config_menu,
            'node' =>  $node,
            'addonMenu' => $addon_menu,
            'addonInfo' =>  $addon_db,
            'name' =>  $name,
            'menu_app' =>  '',
        ];
        $this->assign = array_merge($this->assign, $assign);
    }

    /**
     * 应用入口配置
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function index()
    {
        return $this->show();
    }

    /**
     * 参数配置
     */
    public function config()
    {
        $mp_addon = $this->miniAddonM->getOneByMap([
            'mini_id' => $this->miniId,
            'addon' => $this->addonName
        ]);

        if (request()->isPost()) {
            $input = input('post.');
            $data['mini_id'] = $this->miniId;
            $data['addon'] = $this->addonName;
            $data['infos'] = json_encode($input);

            if (empty($mp_addon)) {
                $this->miniAddonM->addOne($data);
            } else {
                $this->miniAddonM->updateOne(['id' => $mp_addon['id'], 'infos' => $data['infos']]);
            }
            $this->success('配置成功');
        } else {
            $addon_config_mp = json_decode($mp_addon['infos'], true);
            /*$config = json_decode($this->addonCfByDb['config'], true);
            foreach ($config as $key1 => $val1) {
                $val1['value'] = (!empty($addon_config_mp) && isset($addon_config_mp[$val1['name']])) ? $addon_config_mp[$val1['name']] : '';
                $config[$key1] = $val1;
            }*/
            $config = $this->addonCfByFile['config'];
            foreach ($config as $key1 => $val1) {
                $val1['value'] = (!empty($addon_config_mp) && isset($addon_config_mp[$val1['name']])) ? $addon_config_mp[$val1['name']] : $val1['value'];
                $config[$key1] = $val1;
            }

            $themes = [];
            $selected = '';

            if (isset($this->addonCfByFile['is_theme']) && $this->addonCfByFile['is_theme'] == true) {
                $themes = controller('common/addon', 'event')->getAddonThemes(['name' => $this->addonName]);
                if (isset($addon_config_mp['theme']) && !empty($addon_config_mp['theme'])) {
                    $selected = $addon_config_mp['theme'];
                }
            }
            $assign = [
                'selected' => $selected,
                'themes' => $themes,
                'config' => $config
            ];
            return $this->show($assign);
        }
    }

    /**
     * 应用的业务控制台
     * @param $node
     * @return mixed
     * @author: fudaoji<fdj@kuryun.cn>
     */
    public function console($node)
    {
        $node = str_replace('-', '/', $node);
        $url = addon_url($node, ['mid' => $this->miniId]); //dump($url);exit;
        $assign = ['url' => $url];
        return $this->show($assign);
    }
}