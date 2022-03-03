var book_last_name = $("#book_last_name").val();
var book_first_name = $("#book_first_name").val();
var book_id = $("#book_id").val();

$(".same_traveler").on("change", function (e) {
    // console.log(e.target);
    $(e.target).closest("div.traveler_infor").find(".traveler_last_name").val(book_last_name);
    $(e.target).closest("div.traveler_infor").find(".traveler_first_name").val(book_first_name);
    $(e.target).closest("div.traveler_infor").find(".traveler_id").val(book_id);
})
												


$(document).ready(function () {


    $('.numberoftraveler').on('change', function (e) {
        var numberoftraveler = $(this).val();

        var tmp = $(this).next("div.tmp");
        tmp.empty();
        for (var i = 0; i < numberoftraveler; i++) {
            var html = `<div class="traveler_infor">
                    <div class="txt">
                        旅客
                        <button class="btn_ex" type="button" onclick="clear_info(this);">清空</button>
                    </div>
                    <div class="same_person">
                        <select class="same_traveler" >
                            <option selected>請選擇</option>
                            <option value="same">同訂購人資料</option>
                        </select>
                    </div>

                    <div class="form_group">
                        <label>出生日期 <span class="require_mark">*</span><br></label> <br>
                        <input type="text" name="birthday" class="birthday"
                            id="f_date1">
                        <div class="tip_text_danger">此欄位必填</div>
                    </div>
                    <div class="form_group">
                        <label style="margin-left: 10px">性別 <span
                            class="require_mark">*</span><br></label> <br> <select
                            name="gender" class="traveler_gender" id="traveler_gender">
                            <option selected>請選擇</option> 
                            <option value="男">男生</option>
                            <option value="女">女生</option>
                        </select>
                        <div class="tip_text_danger">此欄位必填</div>
                    </div>
                    <div class="form_group">
                        <label>證件號碼(護照/身分證) <span class="require_mark">*</span><br></label>
                        <br> <input type="text" name="idno" class="traveler_id"
                            id="traveler_id">
                        <div class="tip_text_danger">此欄位必填</div>
                    </div>
                    <div class="form_group">
                        <label style="margin-left: 10px">姓氏<span
                            class="require_mark">*</span><br></label> <br> <input
                            style="margin-left: 10px" type="text" name="lastname"
                            class="traveler_last_name" id="traveler_last_name">
                        <div class="tip_text_danger">此欄位必填</div>
                    </div>
                    <div class="form_group">
                        <label>名字</label><span class="require_mark">*</span><br> <input
                            type="text" name="firstname" class="traveler_first_name"
                            id="traveler_first_name">
                        <div class="tip_text_danger">此欄位必填</div>
                    </div>
            </div>`;
            $(html).appendTo(tmp);
        }
        dateFormat();
        addNewMembwe();
        // calculate();
    });


})
// 同訂購人資料
function addNewMembwe() {
    $(".same_traveler").on("change", function (e) {
        // console.log(e.target);
        $(e.target).closest("div.traveler_infor").find(".traveler_last_name").val(book_last_name);
        $(e.target).closest("div.traveler_infor").find(".traveler_first_name").val(book_first_name);
        $(e.target).closest("div.traveler_infor").find(".traveler_id").val(book_id);
    })
}


function dateFormat() {
    $(".same_traveler").on("change", function (e) {
        // console.log(e.target);
        $(e.target).closest("div.traveler_infor").find(".traveler_last_name").val(book_last_name);
        $(e.target).closest("div.traveler_infor").find(".traveler_first_name").val(book_first_name);
        $(e.target).closest("div.traveler_infor").find(".traveler_id").val(book_id);
    })
}
function dateFormat() {
    $.datetimepicker.setLocale('zh');
    $('.birthday').datetimepicker({
        theme: '',              //theme: 'dark',
        timepicker: false,       //timepicker:true,
        step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
        format: 'Y-m-d',         //format:'Y-m-d H:i:s',
        value: '<%=birthday%> ', // value:   new Date(),
        //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
        //startDate:	            '2017/07/10',  // 起始日
        //minDate:               '-1970-01-01', // 去除今日(不含)之前
        //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
    });
}