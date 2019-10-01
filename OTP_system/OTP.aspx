<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="OTP.aspx.cs" Inherits="OTP_system.OTP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <table class="table table-responsive table-hover">
       <tr>
           <td>
             PLEASE ENTER YOUR OTP CODE  <asp:TextBox ID="txt_otp" CssClass="form-control" runat="server"></asp:TextBox>
           </td>
           <td>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txt_otp" ValidationGroup="chk" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Secrt Pic Code"></asp:RequiredFieldValidator>
          </td>
              
               </tr>
                <tr>
                     <td>
               <asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
           </td>
           <td>
               <asp:LinkButton ID="confirm" OnClick="confirm_Click" CssClass="btn bg-success fa fa-check" ValidationGroup="chk" runat="server">Confirm</asp:LinkButton>
           </td>
       </tr>
   </table>
</asp:Content>
