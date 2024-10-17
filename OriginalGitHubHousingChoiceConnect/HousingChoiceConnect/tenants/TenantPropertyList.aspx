﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/UserDashboard.Master"
    CodeBehind="TenantPropertyList.aspx.vb" Inherits="HousingChoiceConnect.TenantPropertyList" %>

<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.Configuration" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        Dim userID As String
        If Not Web.HttpContext.Current.Session("UserID") Is Nothing Then
            userID = Web.HttpContext.Current.Session("UserID").ToString()
        End If

        If userID = Nothing Then
            userID = Request.QueryString("UserID")
            Web.HttpContext.Current.Session("UserID") = userID
        End If

        Dim conn As SqlConnection = New SqlConnection(WebConfigurationManager.ConnectionStrings("HousingChoiceConnectConnectionString").ConnectionString)
        conn.Open()
        Dim totalActiveProperties As Integer
        Dim queryTotalProperties As New SqlCommand("SELECT COUNT(LandlordPropertyID) As TotalActive FROM LandlordProperty WHERE IsActive = '1'", conn)
        Dim readerTotalProperties As SqlDataReader = queryTotalProperties.ExecuteReader()
        While readerTotalProperties.Read
            totalActiveProperties = CStr(readerTotalProperties("TotalActive"))
        End While
        conn.Close()

        conn.Open()
        Dim lastDateOfPostage As Date
        Dim querylastDateOfPostage As New SqlCommand("SELECT TOP 1 DateOfPostage FROM LandlordProperty ORDER BY DateOfPostage DESC", conn)
        Dim readerlastDateOfPostage As SqlDataReader = querylastDateOfPostage.ExecuteReader()
        While readerlastDateOfPostage.Read
            lastDateOfPostage = CStr(readerlastDateOfPostage("DateOfPostage"))
        End While
        conn.Close()
    %>
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        <i class="fa fa-home"></i>&nbsp;Find Your <i>PERFECT</i> Home</h1>
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-calendar fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                    <div class="huge">
                                           <% Response.Write(lastDateOfPostage.ToString("MM/dd/yyy", CultureInfo.InvariantCulture))%></div>
                                        <div>
                                            Last Property Posted</div>
                                    </div>
                                </div>
                            </div>
                             <a href="#" class="list-group-item"><i class="fa fa-calendar" aria-hidden="true"></i>
                                            Last Property Posted<span class="label label-info pull-right"><% Response.Write(lastDateOfPostage.ToString("MM/dd/yyy", CultureInfo.InvariantCulture))%></span>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-home fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                            <% Response.Write(totalActiveProperties)%></div>
                                        <div>
                                           Total Available Properties</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" class="list-group-item"><i class="fa fa-calendar" aria-hidden="true"></i>
                                Total Available Properties
                                <span class="label label-info pull-right"><% Response.Write(totalActiveProperties)%></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <i class="fa fa-filter fa-fw"></i>&nbsp;Filter Property Search
                            </div>
                            <div class="panel-body">
                                <div class="panel panel-success">
                                    <div class="panel-heading text-center">
                                        <h3 class="panel-title">
                                            <i class="fa fa-filter" aria-hidden="true"></i>&nbsp;Filter Property Search
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="list-group">
                                            <div class="list-group-item">
                                                <div class="input-group input-group-lg">
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span>
                                                    </span>
                                                    <asp:DropDownList ID="ZipCode" runat="server" CssClass="selectpicker" DataSourceID="SqlZipCode"
                                                        DataTextField="ZipCode" DataValueField="ZipCode">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlZipCode" runat="server" ConnectionString="<%$ ConnectionStrings:HousingChoiceConnectConnectionString %>"
                                                        SelectCommand="SELECT distinct [ZipCode] FROM [Neighborhood]"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="list-group-item">
                                                <div class="input-group input-group-lg">
                                                    <span class="input-group-addon" id="Span4"><span class="glyphicon glyphicon-bed"></span>
                                                    </span>
                                                    <asp:DropDownList ID="Bedroom" runat="server" CssClass="selectpicker">
                                                        <asp:ListItem Enabled="true" Text="Bedroom" Value="-1"></asp:ListItem>
                                                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="list-group-item">
                                                <div class="input-group input-group-lg">
                                                    <span class="input-group-addon" id="Span5"><span class="glyphicon glyphicon-bitcoin">
                                                    </span></span>
                                                    <asp:DropDownList ID="Bathroom" runat="server" CssClass="selectpicker">
                                                        <asp:ListItem Enabled="true" Text="Bathroom" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="1.5" Value="1.5"></asp:ListItem>
                                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="2.5" Value="2.5"></asp:ListItem>
                                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="3.5" Value="3.5"></asp:ListItem>
                                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="4.5" Value="4.5"></asp:ListItem>
                                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="list-group-item">
                                                <div class="input-group input-group-lg">
                                                    <span class="input-group-addon">$</span>
                                                    <asp:TextBox ID="rentText" runat="server" class="form-control" placeholder="Max Rent "
                                                        MaxLength="4" aria-describedby="sizing-addon1"></asp:TextBox>
                                                    <span class="input-group-addon">.00</span>
                                                </div>
                                            </div>
                                            <div class="list-group-item text-center">
                                                <button type="button" class="btn btn-info btn-block btn-lg" runat="server" onserverclick="BtnFilterProperties">
                                                    <i class="fa fa-filter"></i>&nbsp;Filter Properties
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <i class="fa fa-file-excel-o"></i>&nbsp;Export to Excel
                            </div>
                            <div class="panel-body">
                                <button type="button" class="btn btn-info btn-block btn-lg" runat="server" onserverclick="BtnExportToExcel">
                                    <i class="fa fa-file-excel-o"></i>&nbsp;Export to Excel
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <i class="fa fa-home"></i>&nbsp;Properties
                            </div>
                            <div class="panel-body">
                                <asp:SqlDataSource ID="sqlProperties" runat="server" ConnectionString="<%$ ConnectionStrings:HousingChoiceConnectConnectionString %>"
                                    SelectCommand="SELECT LandlordPropertyID, RTRIM([AddressProperty] + ' ' + [Apt_Suite]) As &quot;Address&quot;,
                                                                         Rent, BedroomNumber AS Bed, BathroomNumber As Bath, ZipCode, 
                                                                         CONVERT (varchar(MAX), CAST(LandlordProperty.DateOfPostage AS date), 101) AS DateOfPostage, 
                                                                         CONVERT (varchar(MAX), CAST(LandlordProperty.DateLastUpdated AS date), 101) AS DateLastUpdated,
                                                                         PersonOfContact As Landlord, PersonToContactPhoneNumber As LandlordNumber 
                                                                  FROM LandlordProperty 
                                                                  INNER JOIN Neighborhood ON LandlordProperty.fk_NeighborhoodID = Neighborhood.NeighborhoodID 
                                                                  WHERE LandlordProperty.IsActive = '1'
                                                                  ORDER BY ZipCode, Bed ASC"></asp:SqlDataSource>
                                <div class="table-responsive">
                                    <asp:GridView ID="GridViewProperties" runat="server" CssClass="table" AutoGenerateColumns="False"
                                        DataKeyNames="LandlordPropertyID, Address" GridLines="None" DataSourceID="sqlProperties"
                                        AllowPaging="True" PageSize="20" PagerStyle-CssClass="bs-pagination text-center">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                <%# DisplayViewLink(Eval("LandlordPropertyID"), Eval("Address"))%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" SortExpression="ZipCode" />
                                            <asp:BoundField DataField="Rent" HeaderText="Rent" SortExpression="Rent" />
                                            <asp:BoundField DataField="Bed" HeaderText="Bed" SortExpression="Bed" />
                                            <asp:BoundField DataField="Bath" HeaderText="Bath" SortExpression="Bath" />
                                            <asp:BoundField DataField="DateOfPostage" HeaderText="Date Posted" SortExpression="DateOfPostage" />
                                            <asp:BoundField DataField="DateLastUpdated" HeaderText="Date Last Updated" SortExpression="DateLastUpdated" />
                                            <asp:BoundField DataField="Landlord" HeaderText="Landlord" SortExpression="Landlord" />
                                            <asp:BoundField DataField="LandlordNumber" HeaderText="Landlord Number" SortExpression="LandlordNumber" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>