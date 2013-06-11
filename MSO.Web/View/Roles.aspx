<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MSO.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="MSO.Web.View.Roles" %>

<%@ Register Assembly="MSO.Controls" Namespace="MSO.Controls" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <asp:Panel runat ="server" ID="pnlAddRole">
    <table style="width:100%">
        <tr > <th colspan="4">Create Role</th></tr>
        
        <tr>
            <td colspan ="2">
                <cc1:MSOButton ID="btnBackAdd" runat ="server" Text="Back" 
                    onclick="btnBackAdd_Click" />
                <cc1:MSOButton ID="btnSave" runat ="server" Text="Save" 
                    onclick="btnSave_Click" />
                <cc1:MSOButton ID="btnDelete" runat ="server" Text="Delete" />
            </td>
            
        </tr> 
        <tr >
            <td style="width:30%">
                <asp:Label ID="lblRoleName" runat="server" Text ="Role Name" ></asp:Label>
            </td>
            <td style="width:70%">
               <cc1:MSOTextbox ID="txtRoleName" runat="server" MaxLength="50"></cc1:MSOTextbox>
               <br />
               <asp:Label ID="lblErrRoleName" CssClass ="lblErrMsg" runat="server" Visible="false"></asp:Label>
            </td>
            
            </tr>
        <tr>
            <td >
                <asp:Label ID="lblRoleDesc" runat="server" Text ="Role Description" ></asp:Label>
            </td>
            <td >
                <cc1:MSOTextbox ID="txtRoleDescription" runat="server"></cc1:MSOTextbox>
                <br />
                <asp:Label ID="lblErrDescription" CssClass ="lblErrMsg" runat="server"  Visible="false" ></asp:Label>

            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:CheckBox ID = "chkDefault" runat ="server" Text = "Default Role for Employee" />
                    <br />
                    <asp:Label ID="lblErrDefault" CssClass ="lblErrMsg" runat="server" Visible="false" ></asp:Label>
               </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblModuleName" Text="Select Module" Visible="false" ></asp:Label>
            </td>
            <td>
            <cc1:MSODropDown ID="drpDwnModuleName" runat="server" 
                    onselectedindexchanged="drpDwnModuleName_SelectedIndexChanged" AutoPostBack="true"></cc1:MSODropDown>
           
                <asp:Label ID="lblErrModule" CssClass ="lblErrMsg" runat="server" Visible="false" ></asp:Label>
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <br />
                <asp:Label ID="lblErrGrid" CssClass ="lblErrMsg" runat="server" Visible="false"  ></asp:Label>
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gridMenuList" runat="server" AutoGenerateColumns="false"  Width ="100%"  DataKeyNames="SUBMENU_ID">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="8%">
                        <HeaderTemplate>Sr.No.</HeaderTemplate>
                        <ItemTemplate>
                        <asp:Label ID="srNo" runat="server" Text="<%# Container.DataItemIndex + 1 %>" ></asp:Label> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField HeaderText="MainMenuId" DataField="MainMenuId"  HeaderStyle-Width ="0%" />  --%>
                         <asp:BoundField HeaderText="Menu Name" DataField="SubMenuName"  HeaderStyle-Width ="30%" />  
     
                 <asp:TemplateField HeaderStyle-Width ="10%" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate  ><asp:CheckBox ID = "chkAddHeader" Text ="Add" runat="server"/></HeaderTemplate>
                        <ItemTemplate>
                           <asp:CheckBox ID="chkAdd" runat="server" />
                        </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderStyle-Width ="6%" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate  ><asp:CheckBox ID = "chkModifyHeader" Text ="Edit" runat="server"/></HeaderTemplate>
                    <ItemTemplate>
                            <asp:CheckBox ID="chkmodify" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
      
                <asp:TemplateField HeaderStyle-Width ="10%" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate  ><asp:CheckBox ID = "chkDelHeader" Text ="Delete" runat="server"/> </HeaderTemplate>
                    <ItemTemplate>
                       <asp:CheckBox ID="chkDelete" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderStyle-Width ="10%">
                    <HeaderTemplate  ><asp:CheckBox ID = "chkViewHeader" Text ="View" runat="server"/> </HeaderTemplate>
                    <ItemTemplate>
                       <asp:CheckBox ID="chkview" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
             
          </Columns>
           </asp:GridView>
          </td>
        </tr>
    </table>
    </asp:Panel>
   
    <asp:Panel ID="pnlSearchRole" runat="server" >
        <table style="width:100%" >
                <tr><th colspan="2">Search Role </th> </tr>
                <tr>
                    <td style="width:30%" colspan="2">
                        <cc1:MSOButton ID="btnBack" runat ="server" Text = "Back" 
                            onclick="btnBack_Click" />
                        <cc1:MSOButton ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
                        <cc1:MSOButton ID="btnSearch" runat="server" Text="Search" 
                            onclick="btnSearch_Click" />
                    </td>
                    
                </tr>
                <tr>
                    <td style="width:30%" >
                        <asp:Label runat="server"  Text ="Role Name"  ID="lblSearchRoleName" > </asp:Label>     
                    </td>
                    <td style="width:70%" >
                        <cc1:MSOTextbox ID="txtSearchRole" runat ="server"></cc1:MSOTextbox>    
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server"  ID="lblDefaultRoleSearch"  Text  = "" Visible="false"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkSearchDefault" runat="server" 
                            Text ="Search For Default Role"  AutoPostBack="true"
                            oncheckedchanged="chkSearchDefault_CheckedChanged" />
                    </td>
                </tr>
                <tr>
                     <td  colspan="2">
                <asp:GridView ID="GrdRoleList" runat="server" AutoGenerateColumns="false" Width="100%"
                    DataKeyNames="ROLE_ID" AllowPaging="true" OnPageIndexChanging="GrdRoleList_PageIndexChanging"
                    OnRowCommand="GrdRoleList_RowCommand" OnRowEditing="GrdRoleList_RowEditing" >
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="8%" >
                            <HeaderTemplate>Sr.No.</HeaderTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                            <ItemTemplate>
                                <asp:Label ID="SrNo" runat="server" Text="<%# Container.DataItemIndex + 1 %>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderStyle-Width="30%">
                            <HeaderTemplate>Role Name</HeaderTemplate>
                            <ItemTemplate>
                                <cc1:MSOLinkButton ID="LinkEdit" Text='<%#Bind("ROLE_NAME")%>' CommandName="Edits"
                                    ForeColor="Blue" CommandArgument="'<%# Container.DataItemIndex %>'" runat="server"></cc1:MSOLinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                  
                  
                        <asp:BoundField HeaderText="Role Description" DataField="ROLE_DESC" HeaderStyle-Width="40%" />

                        <asp:BoundField HeaderText="Default Role" DataField="DefaultRole" HeaderStyle-Width="12%"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />

                        

                        <%--<asp:BoundField HeaderText="Version" DataField="Version" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Right" />--%>
                
           
                
                  
                    </Columns>
                </asp:GridView>
            </td>

                </tr>
        </table>     
    </asp:Panel>
    
    <asp:HiddenField ID = "HdnRoleId" Value= "0" runat="server" />
</asp:Content>