<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Employee/masterPageEmployee.Master" AutoEventWireup="true" CodeBehind="OrderManagement.aspx.cs" Inherits="OPMS_Website.Employee.OderManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeEmployee.aspx">HOME</a></li>
            <li class="current"><a href="OrderManagement.aspx">ORDERS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="box">
        <h3>Account Management</h3>
        <div class="form">
            <fieldset id="personal" class="form" style="text-align: left">
                <legend class="legend" style="width: 54px">SEARCH</legend>&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Name: "></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtName" runat="server" Width="170px" AutoPostBack="True" OnTextChanged="txtName_TextChanged" ToolTip="Input SenderName or ReceiveName"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Label7" runat="server" Text="Status:"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddlStatus" runat="server" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                &nbsp;<br />
                &nbsp;&nbsp;&nbsp; 
                <asp:Label ID="Label3" runat="server" Text="Service :"></asp:Label>
                <asp:DropDownList ID="ddlService" runat="server" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlService_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Distance:"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddlDistance" runat="server" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlDistance_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text="Weight:"></asp:Label><asp:DropDownList
                    ID="ddlWeight" runat="server" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlWeight_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" ForeColor="#0000C0" Text="Total Recod:"></asp:Label>
                <asp:Label
                    ID="lblTotalRecord" runat="server" ForeColor="#404000"></asp:Label>
                <br />
                <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="false" AllowPaging="True" AllowSorting="True" PageSize="15" OnPageIndexChanging="gvOrder_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Order Number" HeaderStyle-Width="20px">
                            <ItemTemplate>
                                <asp:Label ID="lblOrderNumber" Text='<%# Eval("ID") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Create date">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblDate" Text='<%# Convert.ToDateTime(Eval("CreateDate")).ToShortDateString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sender Name">
                            <ItemTemplate>
                                <asp:Label ID="lblSenderName" Text='<%# Eval("SenderName") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Receiver Name">
                            <ItemTemplate>
                                <asp:Label ID="lblReceiverName" runat="server" Text='<%# Eval("ReceiverName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service">
                            <ItemTemplate>
                                <asp:Label ID="lblService" runat="server" Text='<%# Business.ServiceChargeBLL.GetServiceChargeByID(Eval("ServiceChargeID").ToString())[0].Name %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Distance">
                            <ItemTemplate>
                                <asp:Label ID="lblDistance" runat="server" Text='<%# Business.DistanceChargeBLL.GetDistanceChargeByID(Eval("DistanceChargeID").ToString())[0].Name %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Weight">
                            <ItemTemplate>
                                <asp:Label ID="lblWeight" runat="server" Text='<%# Business.WeightChargeBLL.GetWeightChargeByID(Eval("WeightChargeID").ToString())[0].Name %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit"
                                    CommandArgument='<%# Eval("ID") %>'
                                    runat="server" ToolTip="Edit Order" CommandName="EditOrder"
                                    OnCommand="lbtnEdit_Command">Edit</asp:LinkButton>&nbsp;&nbsp;
                                    &nbsp;
                                <asp:LinkButton ID="lbtnUpdate"
                                    CommandArgument='<%# Eval("ID") %>' runat="server"
                                    ToolTip='Update status order'
                                    CommandName="UpdateOrder"
                                    OnCommand="lbtnUpdate_Command">Update</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                &nbsp;
            </fieldset>
        </div>
    </div>
</asp:Content>
