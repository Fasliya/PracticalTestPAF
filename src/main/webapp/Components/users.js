$(document).ready(function() {

    $("#alertSuccess").hide();
    $("#alertError").hide();

});

// Save
$(document).on("click", "#btnSave", function(event) {

    // Clear alerts
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();

    // Form validation
    var status = validateUserForm();
    if (status != true) {
        $("#alertError").text(status);
        $("#alertError").show();
        return;
    }

    // If valid
    var type = ($("#hidUserIDSave").val() == "") ? "POST" : "PUT";

    $.ajax(
        {
            url : "UsersAPI",
            type : type,
            data : $("#formUser").serialize(),
            dataType : "text",
            complete : function(response, status)
            {
                onUserSaveComplete(response.responseText, status);
            }
        });

});

function onUserSaveComplete(response, status) {

    if (status == "success") {

        var resultSet = JSON.parse(response);

        if (resultSet.status.trim() == "success") {

            $("#alertSuccess").text("Successfully saved.");
            $("#alertSuccess").show();
            $("#divUsersGrid").html(resultSet.data);

        } else if (resultSet.status.trim() == "error") {

            $("#alertError").text(resultSet.data);
            $("#alertError").show();

        }
    } else if (status == "error") {

        $("#alertError").text("Error while saving.");
        $("#alertError").show();

    } else {

        $("#alertError").text("Unknown error while saving..");
        $("#alertError").show();

    }

    $("#hidUserIDSave").val("");
    $("#formUser")[0].reset();

}

// Update
$(document).on("click", ".btnUpdate", function(event)
{
    $("#hidUserIDSave").val($(this).closest("tr").find('#hidUserIDUpdate').val());
    $("#firstName").val($(this).closest("tr").find('td:eq(1)').text());
    $("#lastName").val($(this).closest("tr").find('td:eq(2)').text());
    $("#age").val($(this).closest("tr").find('td:eq(3)').text());
    $("#gender").val($(this).closest("tr").find('td:eq(4)').text());
    $("#email").val($(this).closest("tr").find('td:eq(5)').text());
    $("#address").val($(this).closest("tr").find('td:eq(6)').text());
    $("#phoneNumber").val($(this).closest("tr").find('td:eq(7)').text());
    $("#username").val($(this).closest("tr").find('td:eq(8)').text());
    $("#password").val($(this).closest("tr").find('td:eq(9)').text());
});

//Remove
$(document).on("click", ".btnRemove", function(event)
{
    $.ajax(
        {
            url : "UsersAPI",
            type : "DELETE",
            data : "userID=" + $(this).data("userid"),
            dataType : "text",
            complete : function(response, status)
            {
                onUserDeleteComplete(response.responseText, status);
            }
        });
});

function onUserDeleteComplete(response, status) {

    if (status == "success") {

        var resultSet = JSON.parse(response);

        if (resultSet.status.trim() == "success") {

            $("#alertSuccess").text("Successfully deleted.");
            $("#alertSuccess").show();
            $("#divUsersGrid").html(resultSet.data);

        } else if (resultSet.status.trim() == "error") {

            $("#alertError").text(resultSet.data);
            $("#alertError").show();

        }

    } else if (status == "error") {

        $("#alertError").text("Error while deleting.");
        $("#alertError").show();

    } else {

        $("#alertError").text("Unknown error while deleting..");
        $("#alertError").show();

    }

}

// Client Model
function validateUserForm() {

    // FIRST NAME
    if ($("#firstName").val().trim() == "")
    {
        return "Insert First Name.";
    }
    // LAST NAME
    if ($("#lastName").val().trim() == "")
    {
        return "Insert Last Name.";
    }

    // AGE-------------------------------
    if ($("#age").val().trim() == "")
    {
        return "Insert Age.";
    }
    // is numerical value
    var tmpAge = $("#age").val().trim();
    if (!$.isNumeric(tmpAge))
    {
        return "Insert a numerical value for Age.";
    }
    // GENDER------------------------
    if ($("#gender").val().trim() == "")
    {
        return "Insert Gender.";
    }
    // EMAIL------------------------
    if ($("#email").val().trim() == "")
    {
        return "Insert Email Address.";
    }
    // ADDRESS------------------------
    if ($("#address").val().trim() == "")
    {
        return "Insert Address.";
    }
    // PHONE NUMBER------------------------
    if ($("#phoneNumber").val().trim() == "")
    {
        return "Insert Phone Number.";
    }
    // is numerical value
    var tmpPhone = $("#phoneNumber").val().trim();
    if (!$.isNumeric(tmpPhone))
    {
        return "Insert a Valid Phone Number.";
    }
    // USERNAME------------------------
    if ($("#username").val().trim() == "")
    {
        return "Insert Username.";
    }
    // PASSWORD------------------------
    if ($("#password").val().trim() == "")
    {
        return "Insert Password.";
    }

    return true;
}
