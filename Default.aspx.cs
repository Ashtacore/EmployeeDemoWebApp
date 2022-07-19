using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EmployeeDemoWebApp
{
    public partial class Grid : System.Web.UI.Page
    {
        protected void RadGrid1_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
        {
            GridEditableItem item = (GridEditableItem)e.Item;
            String id = item.GetDataKeyValue("EmployeeID").ToString();
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                AlertUser("Employee with ID " + id + " cannot be updated. Reason: " + e.Exception.Message);
            }
            else
            {
                NotifyUser("Employee with ID " + id + " is updated!");
            }
        }

        protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                AlertUser("Employee cannot be inserted. Reason: " + e.Exception.Message);
            }
            else
            {
                NotifyUser("New Employee is inserted!");
            }
        }

        protected void RadGrid1_ItemDeleted(object source, GridDeletedEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            String id = dataItem.GetDataKeyValue("EmployeeID").ToString();
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                AlertUser("Employee with ID " + id + " cannot be deleted. Reason: " + e.Exception.Message);
            }
            else
            {
                NotifyUser("Employee with ID " + id + " is deleted!");
            }

        }

        private void NotifyUser(string message)
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(),
                "toastr_success_" + message, "toastr.success('" + message + "')", true);
        }

        private void AlertUser(string message)
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(),
                "toastr_failure_" + message, "toastr.error('" + message + "')", true);
        }
    }
}
