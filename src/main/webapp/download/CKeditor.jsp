<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.post.model.* , java.util.* , java.sql.Connection, java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement , java.sql.ResultSet , java.sql.SQLException, java.sql.Time"%>
<%@ page import="java.sql.Timestamp , java.util.ArrayList , java.util.Date, java.util.List"%>
<!-- 安安 -->
<%  
// 	PostJDBCDAO dao = new PostJDBCDAO();
// 	List<PostVO> list = dao.getAll();
	String index = "1";
	int x = Integer.parseInt(index);
	System.out.println(request.getParameter("page"));
	if(request.getParameter("page")!= null){
		
		x = Integer.parseInt(request.getParameter("page"));
	}

 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    <title>CK</title>
</head>
<body>     
        <h1>00000000000000</h1>
        <form METHOD="post" ACTION="http://localhost:8081/TestGin/AddPost" name="form1">   
        	<input type="text" name="memberid"></input>請輸入會員編號</br>
        	<input type="text" name="posttitle"></input>請輸入文章標題</br>
        	<input type="text" name="posttypeid"></input>請輸入分類編號
            <div style="width: 1000px">
                <textarea name="postcontent"></textarea>
            </div>
            <input type="submit" value="送出新增">
        </form>
            
        <script>
            //CKEDITOR.replace('editor1');
            CKEDITOR.replace('postcontent', {
                toolbar: [
                    { name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'ExportPdf', 'Preview', 'Print', '-', 'Templates'] },
                    { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] },
                    { name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt'] },
                    { name: 'forms', items: ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'] },
                    '/',
                    { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat'] },
                    { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language'] },
                    { name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
                    { name: 'insert', items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe'] },
                    '/',
                    { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] },
                    { name: 'colors', items: ['TextColor', 'BGColor'] },
                    { name: 'tools', items: ['Maximize', 'ShowBlocks'] },
                    { name: 'about', items: ['About'] }
                ]
            });
           
        </script>
</body>
</html>