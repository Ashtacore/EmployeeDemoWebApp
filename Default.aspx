<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeeDemoWebApp.Grid" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="styles/default.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ConfigurationPanel1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ConfigurationPanel1"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1"></telerik:RadAjaxLoadingPanel>

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" ClientEvents-OnRequestStart="onRequestStart" runat="server" CssClass="grid_wrapper">
        <telerik:RadGrid ID="RadGrid1" runat="server" PageSize="10" PagerStyle-PageButtonCount="5"
            DataSourceID="MainSQLQuery" RenderMode="Auto" AutoGenerateColumns="False"
            OnItemDeleted="RadGrid1_ItemDeleted" OnItemUpdated="RadGrid1_ItemUpdated" 
            AllowPaging="True" AllowSorting="true" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True">
            <ExportSettings ExportOnlyData="true" IgnorePaging="true"></ExportSettings>
            <MasterTableView AutoGenerateColumns="False" EditMode="Batch" 
                AllowFilteringByColumn="False" TableLayout="Fixed"
                DataKeyNames="EmployeeID" CommandItemDisplay="Top"
                InsertItemPageIndexAction="ShowItemOnFirstPage">
                <CommandItemSettings ShowExportToCsvButton="true" 
                                     ShowExportToExcelButton="true" 
                                     ShowExportToPdfButton="true" 
                                     ShowExportToWordButton="true"
                                     ShowAddNewRecordButton = "false"/>
                <BatchEditingSettings EditType="Cell" HighlightDeletedRows="true" OpenEditingEvent="DblClick"/>
                <Columns>
                    <telerik:GridBoundColumn DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID"
                        UniqueName="EmployeeID">
                        <HeaderStyle Width="120px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastName" HeaderText="LastName" SortExpression="LastName"
                        UniqueName="LastName">
                        <HeaderStyle Width="120px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                        UniqueName="FirstName">
                        <HeaderStyle Width="120px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridDateTimeColumn DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate"
                        UniqueName="HireDate" PickerType="DatePicker" DataFormatString="{0:MM/dd/yyyy}">
                        <HeaderStyle Width="120px" />
                    </telerik:GridDateTimeColumn>
                    <telerik:GridDropDownColumn DataSourceID="CustServiceOptions" ListTextField="CustService" ListValueField="CustService"
                        UniqueName="CustService" SortExpression="CustService" HeaderText="CustService" DataField="CustService"
                        AllowAutomaticLoadOnDemand="true"
                        AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="DropDownList">
                        <HeaderStyle Width="120px" />
                    </telerik:GridDropDownColumn>
                    <telerik:GridRatingColumn  DataField="CustTier" HeaderText="CustTier" SortExpression="CustTier"
                        UniqueName="CustTier" ItemCount="7">
                        <HeaderStyle Width="200px" />
                    </telerik:GridRatingColumn>
                    <telerik:GridDropDownColumn DataSourceID="CustTechnicalOptions" ListTextField="CustTechnical" ListValueField="CustTechnical"
                        UniqueName="CustTechnical" SortExpression="CustTechnical" HeaderText="CustTechnical" DataField="CustTechnical"
                        AllowAutomaticLoadOnDemand="true"
                        AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="DropDownList">
                        <HeaderStyle Width="120px" />
                    </telerik:GridDropDownColumn>
                    <telerik:GridBoundColumn DataField="Supervisor" HeaderText="Supervisor" SortExpression="Supervisor"
                        UniqueName="Supervisor">
                        <HeaderStyle Width="175px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridDropDownColumn DataSourceID="StatusOptions" ListTextField="Status" ListValueField="Status"
                        UniqueName="Status" SortExpression="Status" HeaderText="Status" DataField="Status"
                        AllowAutomaticLoadOnDemand="true"
                        AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="DropDownList">
                        <HeaderStyle Width="100px" />
                    </telerik:GridDropDownColumn>
                    <telerik:GridDropDownColumn DataSourceID="TypeOptions" ListTextField="Type" ListValueField="Type"
                        UniqueName="Type" SortExpression="Type" HeaderText="Type" DataField="Type"
                        AllowAutomaticLoadOnDemand="true"
                        AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="DropDownList">
                        <HeaderStyle Width="100px" />
                    </telerik:GridDropDownColumn>
                    <telerik:GridDropDownColumn DataSourceID="OrgOptions" ListTextField="Org" ListValueField="Org"
                        UniqueName="Org" SortExpression="Org" HeaderText="Org" DataField="Org"
                        AllowAutomaticLoadOnDemand="true"
                        AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="DropDownList">
                        <HeaderStyle Width="100px" />
                    </telerik:GridDropDownColumn>
                    <telerik:GridCalculatedColumn UniqueName="Address" HeaderText="Address" AllowSorting="false"
                        DataFields="Address1, Address2, City, State, Zip, Country" 
                        Expression='{0} + " " + {1} + ",<br>" + {2} + ", " + {3} + " " + {4} + ",<br>" + {5}'>
                        <HeaderStyle Width="250px" />
                    </telerik:GridCalculatedColumn>
                    <telerik:GridDateTimeColumn DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified"
                        UniqueName="LastModified" PickerType="DatePicker" DataFormatString="{0:MM/dd/yyyy}">
                        <HeaderStyle Width="120px" />
                    </telerik:GridDateTimeColumn>
                    
                    <telerik:GridButtonColumn ConfirmText="You may be looking to terminate this employee, but this action will delete the employee's record. Continue?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Delete" HeaderText="Delete" HeaderStyle-Width="50px" 
                        CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
                    </telerik:GridButtonColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings AllowColumnsReorder="true" AllowColumnHide="true" AllowDragToGroup="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
            </ClientSettings>
        </telerik:RadGrid>
    </telerik:RadAjaxPanel>

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function onRequestStart(sender, args) {
                if (args.get_eventTarget().indexOf("Button") >= 0) {
                    args.set_enableAjax(false);
                }
            }
        </script>
        <script src="<%=Page.ResolveUrl("https://code.jquery.com/jquery-3.6.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Page.ResolveUrl("https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js")%>" type="text/javascript"></script>
        <link rel="stylesheet" href="<%=Page.ResolveUrl("https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css")%>" type="text/css" />
    </telerik:RadCodeBlock>

    <%--Sql Stuff--%>
    <asp:SqlDataSource ID="MainSQLQuery" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLExpress %>"
        DeleteCommand="BEGIN TRANSACTION
                       DELETE ectf FROM [EmployeeCustomTabFields] ectf
                       WHERE [Employee] = @EmployeeID;

                       DELETE em FROM [EM] em
                       WHERE [Employee] = @EmployeeID;
                       COMMIT"
        UpdateCommand="BEGIN TRANSACTION
                       UPDATE em SET em.[LastName] = @LastName, em.[FirstName] = @FirstName, em.[HireDate] = @HireDate,
	                            em.[Supervisor] = em2.[Employee], em.[Status] = @Status, em.[Type] = @Type,
                                em.[Org] = @Org, em.[ModDate] = CURRENT_TIMESTAMP
                       FROM [EM] em LEFT JOIN [EM] em2 on (@Supervisor = CONCAT(em2.LastName, ', ', em2.FirstName))
                       WHERE em.[Employee] = @EmployeeID;
        
                       UPDATE ectf SET [CustService] = @CustService, [CustTier] = @CustTier,
                                [CustTechnical] = @CustTechnical, [ModDate] = CURRENT_TIMESTAMP
                       FROM [EmployeeCustomTabFields] ectf WHERE [Employee] = @EmployeeID;
                       COMMIT"
        SelectCommand="SELECT em.[Employee] as EmployeeID, em.[LastName], em.[FirstName], em.[HireDate], 
	                            [CustService], [CustTier], [CustTechnical],
                                CONCAT(em2.LastName, ', ', em2.FirstName) as 'Supervisor',
	                            em.[Status], em.[Type],	em.[Org], em.[Address1], em.[Address2], em.[City], em.[State], em.[ZIP], em.[Country], em.[HomePhone],
                                (CASE WHEN em.[ModDate] > ectf.[ModDate] THEN em.[ModDate] ELSE ectf.[ModDate] END) as 'LastModified'
                        FROM [EM] em INNER JOIN [EmployeeCustomTabFields] ectf ON (em.Employee = ectf.Employee)
	                            LEFT JOIN [EM] em2 on (em.Supervisor = em2.Employee)">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="HireDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="CustService" Type="String"></asp:Parameter>
            <asp:Parameter Name="CustTier" Type="int16"></asp:Parameter>
            <asp:Parameter Name="CustTechnical" Type="String"></asp:Parameter>
            <asp:Parameter Name="Status" Type="String"></asp:Parameter>
            <asp:Parameter Name="Type" Type="String"></asp:Parameter>
            <asp:Parameter Name="Org" Type="String"></asp:Parameter>
            <asp:Parameter Name="Supervisor" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmployeeID" Type="String"></asp:Parameter>
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String"></asp:Parameter>
            <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UnitPrice" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="Discontinued" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="QuantityPerUnit" Type="String"></asp:Parameter>
            <asp:Parameter Name="UnitsInStock" Type="Int16"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="CustServiceOptions" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLExpress %>"
        SelectCommand="select DISTINCT [CustService] from [EmployeeCustomTabFields]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="CustTechnicalOptions" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLExpress %>"
        SelectCommand="select DISTINCT [CustTechnical] from [EmployeeCustomTabFields]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="StatusOptions" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLExpress %>"
        SelectCommand="select DISTINCT [Status] from [EM]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="TypeOptions" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLExpress %>"
        SelectCommand="select DISTINCT [Type] from [EM]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="OrgOptions" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLExpress %>"
        SelectCommand="select DISTINCT [Org] from [EM]"></asp:SqlDataSource>
</asp:Content>


