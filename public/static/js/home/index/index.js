layui.use(["carousel"], function () {
    var carousel = layui.carousel;

    //建造实例
    carousel.render({
        elem: '#swiper'
        ,width: '100%' //设置容器宽度
        ,height: '500px'
        ,arrow: 'always' //始终显示箭头
        //,anim: 'updown' //切换动画方式
    });

});