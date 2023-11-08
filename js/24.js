// $(document).ready(function () {
//     $("#submitbtn").setAttribute("disabled", "disabled");


//     console.log("success");
//     // $('#checkbox').on(change, function () {
//     //     if ($(this).is(':checked')) {
//     //         // Do stuff
//     //         alert("success");
//     //     }
//     //     else {
//     //         $("#error").text = "please tick the checkbox"
//     //     }
//     // });

// });

$(document).ready(function () {
    document.getElementById("submitbtn").setAttribute("disabled", "disabled");

    $("#mymail").change(function () {
        const emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}$/;
        let mailid = $(this).val();
        if (emailPattern.test(mailid)) {
            $('#error').text("");
            return true;
        }
        else {
            $("#checkbox").prop("checked", false);
            $('#error').text("Invalid mail id");
            return false;
        }
    })

    $('#checkbox').on("click", function () {
        let mail = $("#mymail").val();
        let name = $("#myname").val();
        if ($(this).is(':checked')) {
            alert("success");
            $.ajax({
                url: "Component/24_Ajax_validation.cfc?method=api",
                type: "post", 
                data: {
                    myname: name,
                    mymail: mail
                },
                success: function (data) {
                    var retval = $(data).find("string").text();

                    if (retval == 1) {
                        $("#checkbox").prop("checked", false);
                        $("#error").text("The subscribe is aleady exist in this mail id. Change the mail id...");

                    }
                    else {
                        document.getElementById("submitbtn").removeAttribute('disabled');
                    }
                }
            });
        }
    });

    $("#submitbtn").click(function () {
        let name = $("#myname").val();
        let mail = $("#mymail").val();
        const letteronly = /^[a-zA-Z ]*$/;
        // alert(mymail, myname);
        if (name == "" || mail == "") {
            $('#error').text("All fields are required");
            return false;
        }
        else if (!letteronly.test(name)) {
            $('#error').text("Invalid name");
            return false;
        }
        else {
            $.ajax({
                url: "Component/24_Ajax_validation.cfc?method=subscription",
                type: "post",
                data: {
                    myname: name,
                    mymail: mail
                },
                success: function (data) {
                    // var retval = $(data).find("string").text();

                    // if (retval == 1) {
                    //     $("#checkbox").prop("checked", false);
                    //     $("#error").text("The subscribe is aleady exist in this mail id. Change the mail id...");

                    // }
                    // else {
                    //     document.getElementById("submitbtn").removeAttribute('disabled');
                    // }
                }
            });
        }
    });

});




// function ajaxvalidation() {
//     alert("sdaswd")
// }