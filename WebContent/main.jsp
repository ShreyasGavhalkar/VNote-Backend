<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Vnote | Notes made easy</title>
    <style>
        *{
                padding:0;
                margin: 0;
                box-sizing: border-box;
            }
        
        body
        {
            background : rgb(219, 226, 226);
            
        }

        img{
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }
        .btn1
        {
            border: none;
            outline: none;
            height: 50px;
            width: 100%;
            background-color: black;
            color: white;
            border-radius: 4px;
            font-weight:bold ;

        }
        .btn1:hover
        {
            background: white;
            border: 1px solid;
            color: black;
        }


        </style>

  </div>
  </head>
  <body>
  <script>
  
  function delete_notes()
  {
     var elements = document.querySelectorAll('.form-check-input');
     var selected_ids = [];
     
     for(var i = 0; i<elements.length; i++)
     {
         if(elements[i].checked)
         {
            selected_ids.push(elements[i].id);
         }
     }
     if(selected_ids.length == 0)
    	 {
    	   alert(" Please select the  items ");
    	   return false;
    	 }
     else
    	 {
    	    var hiddenSelectedItems = document.getElementById("SelectedItems");
    	    hiddenSelectedItems.value = selected_ids.join(",");
    	    
    	    var form = document.getElementById("send_delete");
    	    form.submit();
    	    return true;
    	 }
     
    
  }
    function valid_form()
    {
  	  var newnote = document.getElementById("notetext");
  	  var newdate = document.getElementById("date");
  	  
  	  if(newnote.value == "")
  		  {
  		     alert("Enter the Note");
  	         return false;
  		  }
  	  
  	   else
          {
  		    var data = []
  		    data.push(newnote.value);
  		  var date_val = newdate.value;
  			if(date_val === "")
  			{
  		   		date_val = "NULL";
  			}
  		    data.push(date_val);
  		    var NewNote = document.getElementById("NewNote");
  		    NewNote.value = data.join(",");
  		    console.log(data);
  		    document.getElementById("addnote").submit();
  		    return true;
          }
  	  
  	 
  	  
    }
      
  
  
  </script>
  <%@ page import="java.util.ArrayList"  %>
  <%@ page import="java.sql.*"  %>
  <%
      if(session.getAttribute("user") == null || session.getAttribute("user") == "FAIL")
      {
         response.sendRedirect("login.jsp");
      }
      else
      {
    	  System.out.println("Email: "+session.getAttribute("user"));
      }
    
      
  %>
  <%!
  	
  	String url = "jdbc:mysql://localhost:3306/Vnote"; // required for jdbc
	String sqlUser = "root";
	String sqlPassword = "root@SQL123";
  	
	
	
  	public ArrayList<String[]> fetchNotes(String email) throws ClassNotFoundException{
  		ArrayList<String[]> retNotes= new ArrayList<String[]>();
  		Class.forName("com.mysql.jdbc.Driver");   //load driver
  		try(Connection conn= DriverManager.getConnection(url, sqlUser, sqlPassword); Statement smt= conn.createStatement();){
 			System.out.println("NOTES:");
  			String query="SELECT * FROM `"+email+"` WHERE task= 0";
  			ResultSet rs = smt.executeQuery(query);
  			while(rs.next()){
  	  			String[] data= new String[2];      //this has note at 0 and id at 1 indices
  				String note=rs.getString("note");
  				int id= rs.getInt("id");
  				data[0]=note;
  				System.out.println("Data[0]: "+data[0]);
  				
  				
  				data[1]=String.valueOf(id);
  				System.out.println("Data[1]: "+data[1]);
  				retNotes.add(data);
  				System.out.println("Data is: "+data);
  			}
  			System.out.println(retNotes.toString());
  			return retNotes;
  		}
  		catch(SQLException e){
  			System.out.println(e);
  			return (new ArrayList<String[]>());
  		}
  	}
  	
  	public ArrayList<String[]> fetchTasks(String email) throws ClassNotFoundException, SQLException{
  		ArrayList<String[]> retTasks= new ArrayList<String[]>();  //thsi holds the vlues that the function returns
  		Class.forName("com.mysql.jdbc.Driver");    //loading jdbc driver
  		try(Connection conn= DriverManager.getConnection(url,sqlUser,sqlPassword); Statement smt= conn.createStatement();){
  			System.out.println("TASKS: ");
  			String query="SELECT * FROM `"+email+"` WHERE task= 1";   
  			ResultSet rs = smt.executeQuery(query);
  			while(rs.next()){
  				String data[]=new String[3];     //this has note at 0, id at 1 and deadline at 2 indices...
  				String note=rs.getString("note");
  				int id= rs.getInt("id");
  				data[0]=note;
  				System.out.println("Data[0]: "+data[0]);    //assignment
  				
  				
  				data[1]=String.valueOf(id);
  				System.out.println("Data[1]: "+data[1]);   
  				
  				System.out.println("Data is: "+data);
  				
  				data[2]=rs.getString("deadline");
  				System.out.println("Data[2]: "+data[2]);
  				retTasks.add(data);   
  			}
  			return retTasks;
  		}
  		catch(SQLException e){
  			System.out.println(e);
  			return (new ArrayList<String[]>());
  		}
  		
  	}
  		
  	
  	
  %>
    <section class ="Form my-3 mx-3 ">
    <div class="container-fluid" >
        <div class ="row " style=" background: white;
        border-radius: 30px;
        box-shadow: 12px 12px 22px grey;">

            <div class="col">
                <h1 class = "font-weight-bold px-5 pt-5">Vnote</h1>
                <h4 class = "px-5 pt-2 py-5">Welcome to an organized life!</h4>
                <form class = "px-5" id = "addnote"  method = "post" action ="addNote">
                <input type="hidden" name="NewNote" id="NewNote"/>

                    <div class ="row">
                        <div class="col-lg-9">
                            <h5 style="color: rgb(85, 85, 85);"> Add a new note/task:</h5>
                        </div>
                        <div class="col">
                            <h5 style="color: rgb(85, 85, 85);"> Add Date (if task):</h5>
                        </div>
                        </div>
<!-- Inputs -->
                    <div class ="row">
                        <div class="col-lg-9">
                            <input type ="text" id = "notetext" placeholder="Add Note Here...." class = "form-control my-3 p-4 ">
                        </div>
                        <div class="col">
                            <input type ="text" id = "date" placeholder="DD/MM/YYYY" class = "form-control my-3 p-4 ">
                        </div>
                    </div>
                    
<!-- Button -->
  
                    <div class ="form-row">
                        <div class="col-lg-4">
                        <button type ="submit" onClick = "return valid_form()" name="delete" class="btn1 mt-3 mb-5">Add Note</button>
                    </div>
                
                    </div>
                    
<!-- Head labels -->
                </form>
                <div class ="row " >
                    <div class="col mx-3 px-5 py-3">
                        <h5 style="color: rgb(85, 85, 85);"> Notes:</h5>
                    </div>

                    <div class="col mx-3 px-5 py-3">
                        <h5 style="color: rgb(85, 85, 85);"> Tasks:</h5>
                    </div>

                </div>


<!-- Output Tables -->
                <%
                    ArrayList<String[]> notes = fetchNotes((String)session.getAttribute("user")); //get_notes(session.getAttribute("user")); //[id, note]
                	ArrayList<String[]> todos = fetchTasks((String)session.getAttribute("user")); //get_todos(session.getAttribute("user")); //[id, todo, deadline]
                    System.out.println("Note array size: "+notes.size());
                    System.out.println("todos array size: "+todos.size());

                    
                    //[id, note]
                    //fetchNotes("shreyas@gmail.com");
                	//fetchTasks("shreyas@gmail.com");
                	 int i = 0;
                	 int j = 0;
                      for(; i<notes.size() && j<todos.size(); i++,j++)
                      { 
                    	  //First the note (i)
                    	  String div1 =  "<div class =\"row py-4 px-4\" > ";
                    	  String div2 = "<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(235, 235, 235) ;"+" border-radius: 26px;";
                    	  
                    	  String div3 = "box-shadow: 0px 8px 15px rgb(107, 107, 107);\">";
                    	  String div4 = " <div class=\"form-check-inline\">";
                    	  String id_note = "<input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"" + notes.get(i)[1] +  "\" checked\"> </div>";
                    	  String id_todo = "<input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"" + todos.get(i)[1] +  "\" checked\"> </div>";
                    	  String note_content = "<output name=\"notes\">"+notes.get(i)[0]+"</output> </div>";   //notes.get(i).get(2)
                    	  String todo_content = "<output name=\"todo\">"+todos.get(j)[0]+"</output> <br><br><br> <b> Deadline: "+todos.get(j)[2]+"</b></div>"; 
                    	  
                    	  out.println(div1);
                    	  out.println(div2);
                    	  out.println(div3);
                    	  out.println(div4);
                    	  out.println(id_note);
                    	  out.println(note_content);
                    	  
                    	  
                    	  //First the todo (j)
                    	  
                    	  
                    	  out.println(div2);
                    	  out.println(div3);
                    	  out.println(div4);
                    	  out.println(id_todo);
                    	  out.println(todo_content);
                    	  out.println("</div>");

                    	                     	  
                    	 
                      }
                      
                      
                      if(j<todos.size())
                      { for(; j<todos.size(); j++)
                         {
                    	  
                    	  String div1 =  "<div class =\"row py-4 px-4\" > ";
                    	  String div2 = "<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(235, 235, 235) ;"+" border-radius: 26px;";
                    	  String div3 = "box-shadow: 0px 8px 15px rgb(107, 107, 107);\">";
                    	  String div4 = " <div class=\"form-check-inline\">";
                    	  String id_todo = "<input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"" + todos.get(j)[1] +  "\" checked\"> </div>";
                    	  String todo_content = "<output name=\"todo\">"+todos.get(j)[0]+"</output> <br><br><br> <b> Deadline: "+todos.get(j)[2]+"</b></div>"; 
                       	  
                       	  
                    	  out.println(div1);
                    	  out.println("<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(255, 255, 255) ;"+" border-radius: 26px;");
                    	  out.println("box-shadow: 0px 0px 0px rgb(255, 255, 255);\">");
                    	  out.println("</div>");
                    	  
                    	 // out.println(div1);
                    	  out.println(div2);
                    	  out.println(div3);
                    	  out.println(div4);
                    	  out.println(id_todo);
                    	  out.println(todo_content);
                    	  out.println("</div>");
                    	  
                    	  
                         }
                      }
                      else if(i<notes.size())
                      {
                    	  for(; i<notes.size(); i++)
                          {
                     	  
                     	  String div1 =  "<div class =\"row py-4 px-4\" > ";
                     	  String div2 = "<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(235, 235, 235) ;"+" border-radius: 26px;";
                     	  String div3 = "box-shadow: 0px 8px 15px rgb(107, 107, 107);\">";
                     	  String div4 = " <div class=\"form-check-inline\">";
                     	  String id_note = "<input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"" + notes.get(i)[1] +  "\" checked\"> </div>";
                     	  String note_content = "<output name=\"notes\">"+notes.get(i)[0]+"</output> </div>"; 
                        	  
                             	  
                     	  out.println(div1);
                     	  out.println(div2);
                     	  out.println(div3);
                     	  out.println(div4);
                     	  out.println(id_note);
                     	  out.println(note_content);
                     	  
                     	  
                     	  out.println("<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(255, 255, 255) ;"+" border-radius: 26px;");
                    	  out.println("box-shadow: 0px 0px 0px rgb(255, 255, 255);\">");
                    	  out.println("</div>");
                    	  out.println("</div>");
                     	  
                     	  
                          }
                    	  
                      }
                %>
             
                <!-- ================ line 2 end============= -->
                
<!-- Button 2 -->

                <div class ="form-row px-5">
                    <div class="col-lg-4">
                    <form id = "send_delete" method = "post" action ="deleteNote" > 
                     <input type="hidden" name="SelectedItems" id="SelectedItems"/>
                    <button type ="button" onclick=" return delete_notes()" name="delete" class="btn1 mt-3 mb-5">Delete Selected</button>
                    </form>
                </div>
            
                </div>

                <div class ="row " >
                    <div class="col mx-3 px-5 py-3">
                    
                    </div>

                </div>

                </div>           
            </div>   
                  
    </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>