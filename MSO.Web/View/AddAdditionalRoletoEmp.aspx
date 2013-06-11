<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MSO.Master" AutoEventWireup="true" CodeBehind="AddAdditionalRoletoEmp.aspx.cs" Inherits="MSO.Web.View.AddAdditionalRoletoEmp" %>
<%@ Register Assembly="MSO.Controls" Namespace="MSO.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div>
         <table width="100%">
        <tr>
            <th colspan="4"> Create User and Assigned Roles to User</th>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" />
            </td>
        </tr> 
        
        <tr>
             <td style="width:20%"> <span>Employee Id</span>                
                        
                </td>
                <td style ="width:30%">
                   <asp:TextBox ID="txtEmpID" runat="server" ></asp:TextBox>
                    <br />
                    <asp:Label ID="lblErrEmployeeId" runat="server" CssClass="lblerror"></asp:Label>
                </td>

                <td style="width:20%">Emp Name</td>
            <td style="width:30%">
                 <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox>
                
                <br />
                <asp:Label ID="lblErrEmpName" runat="server" CssClass="lblerror" Visible="false"></asp:Label>
            </td>
        </tr>
       <tr>

        <tr>
            <td >
                <asp:Label ID="lblUserId" Text ="User Id" runat="server" ></asp:Label>
            </td>
            <td colspan ="3">
                <cc1:MSOTextbox ID="txtUserid" runat="server" ></cc1:MSOTextbox>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:CheckBox ID="chkNotEmployee" runat ="server" Text ="Not a Employee" 
                    oncheckedchanged="chkNotEmployee_CheckedChanged"  AutoPostBack= "true" Visible="false" />
               <br />
                  <asp:Label ID="lblErrUserId" runat ="server" Visible ="false"> </asp:Label>
            </td>
           <%-- <td>
                 <asp:Label ID="lblUserName" Text ="User Name" runat="server" ></asp:Label>
            </td>
            <td>
                 <cc1:MSOTextbox ID="txtUserName"  runat ="server"></cc1:MSOTextbox>
                 </td>--%>
        </tr>
   
               <td colspan="4"> <h5 id="main" runat="server" visible="false">Add Roles</h5>
                <asp:GridView ID="Emproles" runat="server" AutoGenerateColumns="false" AllowPaging="false"
                    DataKeyNames="UID" OnRowCommand="Emproles_RowCommand" 
                    OnRowDataBound="Emproles_DataBound">

                    	

                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="10%">
                            <HeaderStyle HorizontalAlign="Right" />
                            <HeaderTemplate> Sr.No.</HeaderTemplate>
                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                            <ItemTemplate>
                                <asp:Label ID="Label1" Text="<%# Container.DataItemIndex + 1 %>" Width="10%" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Emp_id" HeaderText="Employee Id" />
                        <asp:BoundField DataField="EMP_NAME" HeaderText="Employee Id" />
                        <asp:BoundField DataField="USER_ID" HeaderText="Employee Name" />
                        <asp:TemplateField>
                            <HeaderTemplate>Select Role</HeaderTemplate>
                            <HeaderStyle />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:DropDownList ID="drpDownUnassignedRoles" runat="server">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                          
                            <HeaderStyle Width="12%" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="Add" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <h5>No records found,Please try with different search criteria</h5>
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                &nbsp;&nbsp;
            </td>
        </tr>
       
    
        <tr>
            <td colspan="4" style="width: 100%">
                <h5 id="heading" runat="server" visible="false">
                    <strong>Assigned Roles</strong></h5>
                <asp:GridView ID="gridempshowroles" runat="server" AutoGenerateColumns="false" DataKeyNames="User_Role_ID"
                    OnRowCommand="gridempshowroles_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="10%">
                            <HeaderStyle HorizontalAlign="Right" />
                            <HeaderTemplate>
                                Sr.No.
                            </HeaderTemplate>
                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                            <ItemTemplate>
                                <asp:Label ID="Label1" Text="<%# Container.DataItemIndex + 1 %>" Width="10%" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ROLE_NAME" HeaderText="Role Name" HeaderStyle-Width="10%" />
                        <asp:BoundField DataField="ROLE_DESC" HeaderText="Role Description" HeaderStyle-Width="10%" />
                        <asp:TemplateField>
                            <HeaderTemplate>Remove</HeaderTemplate>
                            <HeaderStyle Width="12%" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="imgBtnRemove" runat="server" ImageUrl="~/App_Themes/Images/close.png"
                                    CommandName="Remove" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this record')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <h5>
                            No Assigned Roles found.
                        </h5>
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
