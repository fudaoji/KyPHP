<?php
return array(
    'name' => '应用demo',
    'addon' => 'demo',
    'desc' => '这是一款应用demo，基础的文章功能',
    'version' => '1.0',
    'author' => '苟哥',
    'logo' => 'logo.jpg',
    'entry_url' => 'demo/index/index',
    'install_sql' => 'install.sql',
    'upgrade_sql' => '',
    'menu' => [
        [
            'name' => '文章管理',
            'url' => 'demo/Admin/index',
            'icon' => ''
        ],
    ],
    'config' => array(
        [
            'name' => 'title',
            'title' => '博客名称',
            'type' => 'text',
            'value' => '',
            'placeholder' => '不超过10个字',
            'tip' => '',
        ],
    ),

);