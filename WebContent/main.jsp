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
  <%@ page import="java.util.ArrayList"  %>
  <%
      //if(session.getAttribute("user") == null || session.getAttribute("user") == "FAIL")
     // {
       //  response.sendRedirect("login.jsp");
      //}
    
      
  %>
    <section class ="Form my-3 mx-3 ">
    <div class="container-fluid" >
        <div class ="row " style=" background: white;
        border-radius: 30px;
        box-shadow: 12px 12px 22px grey;">

            <div class="col">
                <h1 class = "font-weight-bold px-5 pt-5">Vnote</h1>
                <h4 class = "px-5 pt-2 py-5">Welcome to an organized life!</h4>
                <form class = "px-5">

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
                            <input type ="text" placeholder="Add Note Here...." class = "form-control my-3 p-4 ">
                        </div>
                        <div class="col">
                            <input type ="text" placeholder="DD/MM/YYYY" class = "form-control my-3 p-4 ">
                        </div>
                    </div>
                    
<!-- Button -->
  
                    <div class ="form-row">
                        <div class="col-lg-4">
                        <button type ="submit" name="delete" class="btn1 mt-3 mb-5">Add Note</button>
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
                    ArrayList< ArrayList<String>> notes = new ArrayList< ArrayList<String>>(); //get_notes(session.getAttribute("user"));
                	ArrayList< ArrayList<String>> todos = new ArrayList< ArrayList<String>>(); //get_todos(session.getAttribute("user"));
                	
                	 int i = 1;
                	 int j = 1;
                      for(; i<=10 && j<=14; i++,j++)
                      { 
                    	  //First the note (i)
                    	  String div1 =  "<div class =\"row py-4 px-4\" > ";
                    	  String div2 = "<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(235, 235, 235) ;"+" border-radius: 26px;";
                    	  
                    	  String div3 = "box-shadow: 0px 8px 15px rgb(107, 107, 107);\">";
                    	  String div4 = " <div class=\"form-check-inline\">";
                    	  String div5 = "<input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"flexCheckChecked\" checked\"> </div>";;
                    	  String note_content = "<output name=\"notes\">"+"Note"+i+"</output> </div>";   //notes.get(i).get(2)
                    	  String todo_content = "<output name=\"notes\">"+"Todo"+j+"</output> </div>"; //todo.get(i).get(2)
                    	  
                    	  out.println(div1);
                    	  out.println(div2);
                    	  out.println(div3);
                    	  out.println(div4);
                    	  out.println(div5);
                    	  out.println(note_content);
                    	  
                    	  
                    	  //First the todo (j)
                    	  
                    	  
                    	  out.println(div2);
                    	  out.println(div3);
                    	  out.println(div4);
                    	  out.println(div5);
                    	  out.println(todo_content);
                    	  out.println("</div>");

                    	                     	  
                    	 
                      }
                      
                      
                      if(j<=14)
                      { for(; j<=14; j++)
                         {
                    	  
                    	  String div1 =  "<div class =\"row py-4 px-4\" > ";
                    	  String div2 = "<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(235, 235, 235) ;"+" border-radius: 26px;";
                    	  String div3 = "box-shadow: 0px 8px 15px rgb(107, 107, 107);\">";
                    	  String div4 = " <div class=\"form-check-inline\">";
                    	  String div5 = "<input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"flexCheckChecked\" checked\"> </div>";
                    	 
                    	  String todo_content = "<output name=\"notes\">"+"Todo"+j+"</output> </div>" ; //todo.get(i).get(2)
                    	  out.println(div1);
                    	  out.println("<div class=\"col mx-3 px-5 py-5\" style=\" background:rgb(255, 255, 255) ;"+" border-radius: 26px;");
                    	  out.println("box-shadow: 0px 0px 0px rgb(255, 255, 255);\">");
                    	  out.println("</div>");
                    	  
                    	 // out.println(div1);
                    	  out.println(div2);
                    	  out.println(div3);
                    	  out.println(div4);
                    	  out.println(div5);
                    	  out.println(todo_content);
                    	  out.println("</div>");
                    	  
                    	  
                         }
                      }
                %>
                <div class ="row py-4 px-4" >
                    <div class="col mx-3 px-5 py-5" style=" background:rgb(235, 235, 235) ;
                    border-radius: 26px;
                    box-shadow: 0px 8px 15px rgb(107, 107, 107);">
                    <!-- label -->
                        <div class="form-check-inline">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked">
                          </div>
                          <!-- output -->
                        <output name="notes">No Notes yet</output>   
                    </div>
    
                    <div class="col mx-3 px-5 py-5"style=" background: rgb(235, 235, 235);
                    border-radius: 26px;
                    box-shadow: 0px 8px 15px rgb(107, 107, 107);">
                    <div class="form-check-inline">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked">
                      </div>
                        
                        <output name="notes"> No Tasks yet</output>
                           
                    </div>
                </div> 

                <!-- ============Line 2 repeat of above (can use only above for loop)================= -->
               
                <div class ="row py-4 px-4" >
                    <div class="col mx-3 px-5 py-5" style=" background:rgb(235, 235, 235) ;
                    border-radius: 26px;
                    box-shadow: 0px 8px 15px rgb(107, 107, 107);">
                    <div class="form-check-inline">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked">
                      </div>
                    <output name="notes"> No Tasks yet</output>
                
                </div>
    
                    <div class="col mx-3 px-5 py-5"style=" background: rgb(235, 235, 235);
                    border-radius: 26px;
                    box-shadow: 0px 8px 15px rgb(107, 107, 107);">

                    <div class="form-check-inline">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked">
                      </div>
                       
                        <output name="notes"> No Tasks yet</output>
                           
                    </div>
                </div>
                <!-- ================ line 2 end============= -->
                
<!-- Button 2 -->

                <div class ="form-row px-5">
                    <div class="col-lg-4">
                    <button type ="button" name="delete" class="btn1 mt-3 mb-5">Delete Selected</button>
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