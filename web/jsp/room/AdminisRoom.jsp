<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>数字框</title>
    <!-- 引入Jquery -->
    <script type="text/javascript" src="../../../easyui/jquery.min.js" charset="utf-8"></script>
    <!-- 引入Jquery_easyui -->
    <script type="text/javascript" src="../../../easyui/jquery.easyui.min.js" charset="utf-8"></script>
    <!-- 引入easyUi国际化--中文 -->
    <script type="text/javascript" src="../../../easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
    <!-- 引入easyUi默认的CSS格式--蓝色 -->
    <link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css"/>
    <!-- 引入easyUi小图标 -->
    <link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css"/>

    <script type="text/javascript">
        var building = [{ "value": "1栋", "text": "1栋" }, { "value": "2栋", "text": "2栋" }, { "value": "3栋", "text": "3栋" }, { "value": "4栋", "text": "4栋" }, { "value": "5栋", "text": "5栋" }, { "value": "6栋", "text": "6栋" }, { "value": "7栋", "text": "7栋" }, { "value": "8栋", "text": "8栋" }, { "value": "9栋", "text": "9栋" }, { "value": "11栋", "text": "11栋" }, { "value": "12栋", "text": "12栋" }, { "value": "12栋", "text": "12栋" }, { "value": "13栋", "text": "13栋" }, { "value": "14栋", "text": "14栋" }];
        function buildingformatter(value, rowData, rowIndex) {
            if (value == 0) {
                return;
            }
            for (var i = 0; i < building.length; i++) {
                if (building[i].value == value) {
                    return building[i].text;
                }
            }
        }
        var floor = [{ "value": "1层", "text": "1层" }, { "value": "2层", "text": "2层" }, { "value": "3层", "text": "3层" }, { "value": "4层", "text": "4层" }, { "value": "5层", "text": "5层" }, { "value": "6层", "text": "6层" }, { "value": "7层", "text": "7层" }, { "value": "8层", "text": "8层" }, { "value": "9层", "text": "9层" }, { "value": "11层", "text": "11层" }, { "value": "12层", "text": "12层" }, { "value": "12层", "text": "12层" }, { "value": "13层", "text": "13层" }, { "value": "14层", "text": "14层" }];
        function floorformatter(value, rowData, rowIndex) {
            if (value == 0) {
                return;
            }
            for (var i = 0; i < floor.length; i++) {
                if (floor[i].value == value) {
                    return floor[i].text;
                }
            }
        }
        $(function () {
            $.extend($.fn.validatebox.defaults.rules, {     //自定义验证
                mobile: {// 验证手机号码
                    validator: function (value) {
                        return /^(13|15|18)\d{9}$/i.test(value);
                    },
                    message: '手机号码格式不正确'
                },
                intOrFloat: {// 验证整数或小数
                    validator: function (value) {
                        return /^\d+(\.\d+)?$/i.test(value);
                    },
                    message: '请输入数字，并确保格式正确'
                },
                myfloat: {// 验证小数
                    validator: function (value) {
                        return /^\d+\.+\d$/i.test(value);
                    },
                    message: '请输入数字，并确保格式正确'
                },
                length: {
                    validator: function (value, param) {
                        var len = $.trim(value).length;
                        return len >= param[0] && len <= param[1];
                    },
                    message: "输入内容长度必须介于{0}和{1}之间."
                },
            });
            obj = {
                editrow: undefined,
                add: function () {
                    $('#save,#redo').show();    //显示保存和取消按钮
                    if (this.editrow == undefined) {
                        $('#mydatagrid').datagrid(  //在第一行进行添加
                            'insertRow', {index: 0, row: {},}
                        );
                    }
                    $('#mydatagrid').datagrid(  //将第一行设为可编辑状态
                        'beginEdit', 0
                    );
                    this.editrow = 0;
                },
                remove: function () {
                    var rows = $('#mydatagrid').datagrid('getSelections');       //返回选中的行，没有时返回空数组
                    if (rows.length > 0) {
                        $.messager.confirm('确认', '确定删除吗？', function (flag) {
                            if (flag) {   //点击了确定
                                var ids = [];
                                for (var i = 0; i < rows.length; i++) {
                                    ids.push(rows[i].roomid);        //用ids.jpis(',')设置用逗号隔开
                                }
                                $.ajax({
                                    type: 'POST',
                                    url: '/AdminisRoom_Delete.servlet',    //  访问handle
                                    data: {
                                        ids: ids.join(','),        //用ids.jpis(',')设置用逗号隔开,可直接用In查询
//                                        ids:ids,
                                    },
                                    beforeSend: function () {
                                        $('#mydatagrid').datagrid('loading');
                                    },
                                    success: function (data) {
                                        if (data) {
                                            $('#mydatagrid').datagrid('loaded');
                                            $('#mydatagrid').datagrid('load');      //自动刷新
                                            $('#mydatagrid').datagrid('unselectAll');
                                            $.messager.show({
                                                title: "提示",
                                                msg: data + "个数据被成功删除！",
                                            });
                                        }
                                    },
                                })
                            }
                        });
                    } else {
                        $.messager.alert('提示', '请选择要删除的记录！', 'info');
                    }
                },
                search: function () {
                    $('#mydatagrid').datagrid(
                        'load', {
                            roomDoor: $('input[name="roomDoor"]').val(),
                            roomHolderName: $('input[name="roomHolderName"]').val(),
                        }
                    );
                },
                edit: function () {
                    var rows = $('#mydatagrid').datagrid('getSelections');       //返回选中的行，没有时返回空数组
                    if (rows.length == 1) {     //选中一条时才可点击修改
                        if (this.editrow != undefined) {
                            $('#mydatagrid').datagrid('endEdit', this.editrow);      //选中第二条时得到第一条的索引
                        }
                        if (this.editrow == undefined) {       //选中第一条时把索引保留
                            var index = $('#mydatagrid').datagrid('getRowIndex', rows[0]);       //得到当前行的索引,此时rows只有一条，但他是对象
                            $('#save,#redo').show();
                            $('#mydatagrid').datagrid('beginEdit', index);

                            // 得到单元格对象,index指哪一行,field跟定义列的那个一样
                            var cellEdit = $('#mydatagrid').datagrid('getEditor', {index: index, field: 'roomid'});
                            var $input = cellEdit.target; // 得到文本框对象
                            //$input.val('aaa'); // 设值
                            $input.prop('readonly', true); // 设值只读

                            this.editrow = index;
                            $('#mydatagrid').datagrid('unselectRow', index);    //取消这一行的选中
                        }//双击开始编辑
                    } else {
                        $.messager.alert('提示', '修改必须且只能选择一行！', 'info');
                    }
                },
                save: function () {    //完成编辑自动触发下面的afterEdit
//                    $('#save,#redo').hide();
//                    this.editrow = false;
                    $('#mydatagrid').datagrid(  //将当前行设为结束编辑状态
                        'endEdit', this.editrow
                    );
                },
                redo: function () {
                    $('#save,#redo').hide();
                    this.editrow = undefined;
                    $('#mydatagrid').datagrid(  //调用回滚方法
                        'rejectChanges'
                    );
                },
            };

            $('#mydatagrid').datagrid({
                title: '物业缴费管理',
                iconCls: 'icon-ok',
                width: 900,
                pageSize: 15,//给后台传rows
                pageList: [15, 20, 25, 30],//可以选择的分页集合
                nowrap: true,//设置为true，当数据长度超出列宽时将会自动截取
                striped: true,//设置为true将交替显示行背景。
                collapsible: false,//显示可折叠按钮
                toolbar: "#tb",//在添加 增添、删除、修改操作的按钮要用到这个
                url: '/AdminisRoom_List.servlet',//url调用Action方法
                loadMsg: '数据装载中......',
                singleSelect: false,//为true时只能选择单行
                fitColumns: true,//允许表格自动缩放，与列宽相对应
//                sortName: 'stuid',//给后台传sort
//                sortOrder: 'DESC',//给后台传order,可以是'asc'或者'desc'（正序或者倒序）。
                remoteSort: false,   //true即从后台拿排了序的数据
//                frozenColumns : [ [ {
//                    field : 'ck',
//                    checkbox : true
//                } ] ],
                pagination: true,//分页
                rownumbers: true,//显示行数
                onDblClickRow: function (rowIndex, rowData) {       //双击时得到index为下标,data为对应数据
                    if (obj.editrow != undefined) {
                        $('#mydatagrid').datagrid('endEdit', obj.editrow);      //选中第二条时得到第一条的索引
                    }
                    if (obj.editrow == undefined) {       //选中第一条时把索引保留
                        $('#save,#redo').show();
                        $('#mydatagrid').datagrid('beginEdit', rowIndex);
                        obj.editrow = rowIndex;

                        // 得到单元格对象,index指哪一行,field跟定义列的那个一样
                        var cellEdit = $('#mydatagrid').datagrid('getEditor', {index: rowIndex, field: 'roomid'});
                        var $input = cellEdit.target; // 得到文本框对象
                        //$input.val('aaa'); // 设值
                        $input.prop('readonly', true); // 设值只读
                    }//双击开始编辑
                },
                onAfterEdit: function (rowIndex, rowData, changes) {     //编辑完成后执行
                    $('#save,#redo').hide();

                    var inserted = $('#mydatagrid').datagrid('getChanges', 'inserted');    //得到编辑情况，得到新增数据，json数组形式
                    var updated = $('#mydatagrid').datagrid('getChanges', 'updated');     //得到修改数据
//                    alert(inserted[0].stuid);
                    if (inserted.length > 0) {      //新增
                        $.ajax({
                            type: 'POST',
                            url: '/AdminisRoom_Add.servlet',    //  访问handle
                            data: {
                                roomid: inserted[0].roomid,
                                roombuilding: inserted[0].roombuilding,
                                roomfloor: inserted[0].roomfloor,
                                roomdoor: inserted[0].roomdoor,
                                roomarea: inserted[0].roomarea,
                                roomholderaccount: inserted[0].roomholderaccount,
                                roomwater: inserted[0].roomwater,
                                roomelectrcity: inserted[0].roomelectrcity,
                                roomgas: inserted[0].roomgas,
                                roomestatefee: inserted[0].roomestatefee,
                                roomholdername: inserted[0].roomholdername,
                            },
                            beforeSend: function () {
                                $('#mydatagrid').datagrid('loading');
                            },
                            success: function (data) {
                                if (data) {
                                    $('#mydatagrid').datagrid('loaded');
                                    $('#mydatagrid').datagrid('load');      //自动刷新
                                    $('#mydatagrid').datagrid('unselectAll');
                                    $.messager.show({
                                        title: "提示",
                                        msg: data + "个数据被成功添加！",
                                    });
                                }
                            },
                        })
                    }
                    if (updated.length > 0) {
                        $.ajax({
                            type: 'POST',
                            url: '/AdminisRoom_Update.servlet',    //  访问handle
                            data: {
                                roomid: updated[0].roomid,
                                roombuilding: updated[0].roombuilding,
                                roomfloor: updated[0].roomfloor,
                                roomdoor: updated[0].roomdoor,
                                roomarea: updated[0].roomarea,
                                roomholderaccount: updated[0].roomholderaccount,
                                roomwater: updated[0].roomwater,
                                roomelectrcity: updated[0].roomelectrcity,
                                roomgas: updated[0].roomgas,
                                roomestatefee: updated[0].roomestatefee,
                                roomholdername: updated[0].roomholdername,
                            },
                            beforeSend: function () {
                                $('#mydatagrid').datagrid('loading');
                            },
                            success: function (data) {
                                if (data) {
                                    $('#mydatagrid').datagrid('loaded');
                                    $('#mydatagrid').datagrid('load');      //自动刷新
                                    $('#mydatagrid').datagrid('unselectAll');
                                    $.messager.show({
                                        title: "提示",
                                        msg: data + "个数据被成功修改！",
                                    });
                                }
                            },
                        })
                    }
                    obj.editrow = undefined;
                },
            });

        });

    </script>

</head>
<body>
<br/><br/><br/><br/><br/><br/>

<div align="center">
    <table id="mydatagrid">
        <thead>
        <tr>
            <th data-options="field:'roomid',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[6,30]'],},}">
                &nbsp;数据ID
            </th>
            <th data-options="field:'roombuilding',width:54,align:'center',formatter: buildingformatter,editor:{type:'combobox',options:{data:building,required:true,editable: false,},}">
                楼栋
            </th>
            <th data-options="field:'roomfloor',width:54,align:'center',formatter: floorformatter,editor:{type:'combobox',options:{data:floor,required:true,editable: false,},}">
                楼层
            </th>
            <th data-options="field:'roomdoor',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[1,10]'],},}">
                门牌号
            </th>
            <th data-options="field:'roomarea',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[1,6]'],},}">
                面积
            </th>
            <th data-options="field:'roomholderaccount',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[1,32]'],},}">
                业主账号
            </th>
            <th data-options="field:'roomwater',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[1,30]'],},}">
                欠水费
            </th>
            <th data-options="field:'roomelectrcity',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[1,30]'],},}">
                欠电费
            </th>
            <th data-options="field:'roomgas',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[1,30]'],},}">
                欠气费
            </th>
            <th data-options="field:'roomestatefee',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[1,30]'],},}">
                欠物业费
            </th>
            <th data-options="field:'roomholdername',width:54,align:'center',editor:{type:'validatebox',options:{required:true,validType:['length[0,10]'],},}">
                &nbsp;业主名称
            </th>
        </tr>
        </thead>
    </table>
</div>
<div id="tb">
    <div>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="obj.add();">增加</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="obj.remove();">删除</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="obj.edit();">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" style="display: none" id="save"
           onclick="obj.save();">保存</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" style="display: none" id="redo"
           onclick="obj.redo();">取消</a>
        <%--<a href="<c:url value='/Logout'/>" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" >退出</a>--%>
    </div>
    <div>
        门牌号<input type="text" name="roomDoor"/>&nbsp;&nbsp;&nbsp;
        业主名<input type="text" name="roomHolderName"/>&nbsp;&nbsp;&nbsp;
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="obj.search();">查询</a>
    </div>
</div>

</body>
</html>


