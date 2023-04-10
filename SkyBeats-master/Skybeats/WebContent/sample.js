$(function(){

    $("#footer").load("success.html"); 
    });
 var name;
 
 function myFunction() {
 this.name=document.getElementById("input").value;
   }
   function display(){
   document.getElementById("write").src=this.name;
   }