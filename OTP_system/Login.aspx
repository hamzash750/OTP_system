<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OTP_system.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           <table class="table table-hover " >
        <tr>
            <td >Enter Email :</td>
            <td >
                <asp:TextBox ID="emaiTextBox" runat="server" placeholder="Enter Email" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="emaiTextBox" Display="Dynamic" ErrorMessage="Email Requried!" ForeColor="Red" ValidationGroup="signIn"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emaiTextBox" Display="Dynamic"  ForeColor="Red" ErrorMessage="Email Format Requried" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signIn"></asp:RegularExpressionValidator>
            </td>
          
        </tr>
        <tr>
            <td >Enter Password:</td>
            <td >
                <asp:TextBox ID="passTextBox" runat="server" TextMode="Password" placeholder="Enter Password" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="passTextBox" ForeColor="Red" ErrorMessage="Password Requried!" ValidationGroup="signIn"></asp:RequiredFieldValidator>
            </td>
            
        </tr>
      
        <tr>
            <td>
            </td>
            <td>
                <asp:LinkButton CssClass="btn btn-success  glyphicon glyphicon-log-in" ID="Login_user" OnClick="Login_user_Click" ValidationGroup="signIn" runat="server">  LogIn</asp:LinkButton> </td>
        </tr>
        <tr>
          <td></td>
            <td><%--<span > <a id="span1" class="btn btn-default" href="SignUp.aspx">New User Register Here?</a></span>--%></td>
        </tr>
        
        
    </table>
    
</asp:Content>
