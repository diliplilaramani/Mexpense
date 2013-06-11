<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MSO.Master" AutoEventWireup="true" CodeBehind="ViewSchme.aspx.cs" Inherits="MSO.Web.View.ViewSchme" %>

<%@ Register Assembly="MSO.Controls" Namespace="MSO.Controls" TagPrefix="cc1" %>
<%@ Register assembly="MSO.Controls" namespace="MSO.UI.Controls" tagprefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageContent" runat="server">
    <style type="text/css">
    
 .leftControltxtBox
{
    Width:178px;  
}

.RightControltxtBox
{
    Width:127px;  
}

.LeftDropDownBox
{
    Width:150px;  
}

.LeftDropDownBox
{
    Width:127px;  
}

.leftColoumn
{
     width: 176px;
}

.RightColoumn
{
     width: 160px;
}

.MiddleTDlength
{
   width: 160px;  
}

.RightTDlength
{
    width:200px;
}

.RightDropDownBox
{
    width:190px;
}
    
    
    
</style>

<div style="padding-top: 10px" class="lft width100pc">

		<table width="100%" cellspacing="0px" cellpadding="0px">
			<tbody><tr>
            
				<td width="100%" class="pstlgnsmhdnew">
				<table width="100%" cellspacing="0px" cellpadding="0px">
					<tbody><tr>
						<td width="80%" align="left" class="pstlgnsmhd"  ><strong>Scheme Details</strong>&nbsp;
						</td>
						
						<td width="18%" align="right" style="padding-right: 5px"></td>
					</tr>
				</tbody></table>
				</td>
			</tr>
			<tr>
				<td width="100%">
				<div class="pstlgnsmbx">
				<div class="pstlgnsminnrbx brdrbtm0">
				<table width="100%" cellspacing="0" cellpadding="5" border="0">
					<tbody>
					<tr>
						<td class="style6">Scheme Id</td>
						<td  >
			
                            &nbsp;</td>
						<td  >Stake holder Approval Id</td>
						<td class="RightTDlength">
                            &nbsp;</td>
					</tr>
					<tr>
						<td class="style6">Scheme Title</td>
						<td >
			
                            &nbsp;</td>
						<td >Adjust Remaining Options </td>
						<td class="RightTDlength">
                            &nbsp;</td>
					</tr>
					<tr>
						<td class="style6">Vesting Over Period</td>
						<td >
	<!--<span style="color:#973301">Rs.</span>-->
			
                        </td>
						<td >Vesting frequency </td>
						<td class="RightTDlength">
			
                            &nbsp;</td>
					</tr>

                    	<tr>
						<td class="style6">Vesting Start After</td>
						<td >
	<!--<span style="color:#973301">Rs.</span>-->
			
                        </td>
						<td >Exericise Start After </td>
						<td class="RightTDlength">
			
                            &nbsp;</td>
					</tr>

                    <tr>
						<td class="style6">Lock for Period</td>
						<td >
	<!--<span style="color:#973301">Rs.</span>-->
			
                        </td>
						<td >Exercise Period Offset</td>
						<td class="RightTDlength">
			
                            &nbsp;</td>
					</tr>

                       <tr>
						<td class="style6">Option Ratio Multiplier</td>
						<td >
                            &nbsp;</td>
						<td >Option Ratio Divisor</td>
						<td class="RightTDlength">
		                    &nbsp;</td>
					</tr>
				</tbody></table>
				</div>
				</div>
				</td>
			</tr>
		</tbody></table>

		</div>
<div style="padding-top: 10px" class="lft width100pc">

		<table width="100%" cellspacing="0px" cellpadding="0px">
			<tbody><tr>
				<td width="100%" class="pstlgnsmhdnew">
				<table width="100%" cellspacing="0px" cellpadding="0px">
					<tbody>
                    <tr>
						<td width="80%" align="left"><strong>Seperation Rule</strong>&nbsp;
						</td>
						
					</tr>
				</tbody></table>
				</td>
			</tr>
			<tr>
				<td width="100%">
				<div class="pstlgnsmbx">
				<div class="pstlgnsminnrbx brdrbtm0">
				<table width="100%" cellspacing="0" cellpadding="5" border="0">
					<tbody><tr>
						<th  id="th3" class="rtln" colspan="2">Death</th>
						<th colspan="2">
                            &nbsp;</th>
					</tr>
					<tr>
						<td >Live Unvested Option for
	                        
		                </td>
						<td >
			<!--	<span style="color:#973301">Rs.</span> -->
                            
                            Vested Option Live Till Exercise Date
	                        
		                </td>
						<td>
                            Live Vested Option for

		                    </td>
						<td>
                            Vest Unvested Option on Seperation Date</td>
                        
                        
                        
					</tr>

                    	<tr>
						<td >
	                        <asp:Label ID="lblDeathLiveUnvestedOptionFor" runat="server" ></asp:Label></td>
						<td >
			                <asp:Label ID="lblDeathVestedOptionLiveTillExersideDt" runat="server"></asp:Label>
		                </td>
                        
						<td>
	                       
			                <asp:Label ID="lblDeathLiveVestedOptionsfor" runat="server"></asp:Label>
		                </td>	                       
						<td> 
                            <asp:Label ID="lblDeathVestUnvestedOptionOnSepDt" runat="server"></asp:Label>
                            </td>
					</tr>
			        
				</tbody></table>
				</div>
				</div>
				</td>
			</tr>
		</tbody></table>

		</div>
<div style="padding-top: 10px" class="lft width100pc">

		<table width="100%" cellspacing="0px" cellpadding="0px">
			<tbody><tr>
				<td width="100%" class="pstlgnsmhdnew">
				<table width="100%" cellspacing="0px" cellpadding="0px">
					<tbody>
                    <tr>
						<td width="80%" align="left"><strong>Seperation Rule</strong>&nbsp;
						</td>
						
					</tr>
				</tbody></table>
				</td>
			</tr>
			<tr>
				<td width="100%">
				<div class="pstlgnsmbx">
				<div class="pstlgnsminnrbx brdrbtm0">
				<table width="100%" cellspacing="0" cellpadding="5" border="0">
					<tbody><tr>
						<th  id="th1" class="rtln" colspan="2">Resignation</th>
						<th colspan="2">
                            &nbsp;</th>
					</tr>
					<tr>
						<td >Live Unvested Option for
	                        
		                </td>
						<td >
			<!--	<span style="color:#973301">Rs.</span> -->
                            
                            Vested Option Live Till Exercise Date
	                        
		                </td>
						<td>
                            Live Vested Option for

		                    </td>
						<td>
                            Vest Unvested Option on Seperation Date</td>
                        
                        
                        
					</tr>

                    	<tr>
						<td >
	                        <asp:Label ID="lblResigLiveUnvestedOptionFor" runat="server" ></asp:Label></td>
						<td >
			                <asp:Label ID="lblResigVestedOptionLiveTillExerciseDate" runat="server"></asp:Label>
		                </td>
                        
						<td>
	                       
			                <asp:Label ID="lblResigLiveVestedOptionfor" runat="server"></asp:Label>
		                </td>	                       
						<td> 
                            <asp:Label ID="lblResigVestUnvestedOptionOnSepDt" runat="server"></asp:Label>
                            </td>
					</tr>
			        
				</tbody></table>
				</div>
				</div>
				</td>
			</tr>
		</tbody></table>

		</div>
        <div style="padding-top: 10px" class="lft width100pc">

		<table width="100%" cellspacing="0px" cellpadding="0px">
			<tbody><tr>
				<td width="100%" class="pstlgnsmhdnew">
				<table width="100%" cellspacing="0px" cellpadding="0px">
					<tbody>
                    <tr>
						<td width="80%" align="left"><strong>Seperation Rule</strong>&nbsp;
						</td>
						
					</tr>
				</tbody></table>
				</td>
			</tr>
			<tr>
				<td width="100%">
				<div class="pstlgnsmbx">
				<div class="pstlgnsminnrbx brdrbtm0">
				<table width="100%" cellspacing="0" cellpadding="5" border="0">
					<tbody><tr>
						<th  id="th2" class="rtln" colspan="2">Retirement</th>
						<th colspan="2">
                            &nbsp;</th>
					</tr>
					<tr>
						<td >Live Unvested Option for
	                        
		                </td>
						<td >
			<!--	<span style="color:#973301">Rs.</span> -->
                            
                            Vested Option Live Till Exercise Date
	                        
		                </td>
						<td>
                            Live Vested Option for

		                    </td>
						<td>
                            Vest Unvested Option on Seperation Date</td>
                        
                        
                        
					</tr>

                    	<tr>
						<td >
	                        <asp:Label ID="lblRetLiveUnVestedOptionFor" runat="server" ></asp:Label></td>
						<td >
			                <asp:Label ID="lblRetVestedOptionLiveTillExerciseDt" runat="server"></asp:Label>
		                </td>
                        
						<td>
	                       
			                <asp:Label ID="lblRetLiveVestedOptionFor" runat="server"></asp:Label>
		                </td>	                       
						<td> 
                            <asp:Label ID="lblRetVestUnVestedOptionSepdt" runat="server"></asp:Label>
                            </td>
					</tr>
			        
				</tbody></table>
				</div>
				</div>
				</td>
			</tr>
		</tbody></table>

		</div>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="rightNavigationContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footernavigation" runat="server">
</asp:Content>
