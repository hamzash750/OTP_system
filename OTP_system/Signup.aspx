<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="OTP_system.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table class="table table-bordered table-hover table-responsive">
        <tr>
            <td> Enter Name</td>
             <td>
                 <asp:TextBox ID="txt_name" CssClass="form-control" runat="server"></asp:TextBox>    
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txt_name" runat="server" ForeColor="Red" ValidationGroup="register" ErrorMessage="Name Required">*</asp:RequiredFieldValidator>   </td>
        </tr>
          <tr>
            <td> Enter Email</td>
             <td>
                 <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_email" runat="server" ForeColor="Red" ValidationGroup="register" ErrorMessage="Email Required">*</asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="(abc@xyz.com Format Requrie)" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="register">*</asp:RegularExpressionValidator>
            </td>
        </tr>
         <tr>
            <td> Enter Phone Number</td>
             <td>
                 <asp:TextBox ID="txt_phonenumber" CssClass="form-control" runat="server"></asp:TextBox>   
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txt_phonenumber" runat="server" ForeColor="Red" ValidationGroup="register" ErrorMessage="Phone Number Required">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Only Numeric Digits allwod" ForeColor="Red" ControlToValidate="txt_phonenumber" ValidationGroup="register" SetFocusOnError="True" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
          <tr>
            <td> Enter City</td>
             <td>
                 <asp:TextBox ID="txt_city" CssClass="form-control" runat="server"></asp:TextBox>    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txt_city" runat="server" ForeColor="Red" ValidationGroup="register" ErrorMessage="City Required">*</asp:RequiredFieldValidator>   </td>
        </tr>
         <tr>
            <td >Enter Password:</td>
            <td >
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_password" ErrorMessage="Password Requried" ForeColor="Red" Display="Dynamic" ValidationGroup="register">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="Password length must be between 7 to 10 characters" ForeColor="Red"  ControlToValidate="txt_password" ValidationGroup="register"   ValidationExpression="^[a-zA-Z0-9\s]{7,10}$">*</asp:RegularExpressionValidator>
                 </td>
           
        </tr>
        <tr>
            <td >Re-type Password:</td>
            <td >
                <asp:TextBox ID="txt_repassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_repassword" Display="Dynamic" ErrorMessage="Password Requre" ForeColor="Red" ValidationGroup="register">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_password" ControlToValidate="txt_repassword" ErrorMessage="Password Does Not Match" ForeColor="Red" Display="Dynamic" ValidationGroup="register">*</asp:CompareValidator>
            </td>
           
        </tr>
         <tr>
            <td >Select Gender:</td>
            <td >
                <asp:DropDownList ID="ddl_gender" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                </asp:DropDownList>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddl_gender" ErrorMessage="Select Gender" InitialValue="Select Gender" ForeColor="Red" ValidationGroup="register">*</asp:RequiredFieldValidator>
                 </td>
          
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="register" ForeColor="Red" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_msg" ForeColor="Red" Font-Bold="true" runat="server" ></asp:Label></td>
              <td colspan="2">
                  <asp:LinkButton ID="userregiser" OnClick="userregiser_Click"  ValidationGroup="register"  CssClass="btn btn-primary pull-right  fa fa-user" runat="server"> REGISTER</asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>
