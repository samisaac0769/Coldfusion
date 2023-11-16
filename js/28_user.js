$(document).ready(function () {
    $("#add").click(function () {
        $("#addtitle").text("ADD NEW PAGE");
        $("#pagename").val("");
        $("#discription").val("");

        $("#formsubmit").click(function () {
            $("#myModal").modal("hide");
            let name = $("#pagename").val();
            let discription = $("#discription").val();
            
            $.ajax({
                url: "Component/28_Simple_CMS.cfc?method=add",
                type: "post",
                data: {
                    namepage: name,
                    discriptionpage: discription
                },
                success: function (data) {
                    let result = $(data).find("string").text();
                    
                    if (result === "true") {
                        alert("Your page Added Successfully...");
                        // window.location.href = "28_admin.cfm";
                    }
                    // else {
                    //     //alert("Something went wrong.Try again...");
                    // }
                }
            });
            
        });

    });
    
    $(".edit").click(function () {
        var id = $(this).data('page');
        $.ajax({
            url: "Component/28_Simple_CMS.cfc?method=getPageById",
            type: "get",
            data: {
                pageId: id
            },
            success: function (data) {
                var parsedData = JSON.parse(data);
                alert(parsedData);

                var pagename = parsedData.DATA[0][0];
                var pagedescription = parsedData.DATA[0][1];

                $("#addtitle").text("EDIT PAGE");
                $("#myModal").modal("show");
                $("#pagename").val(pagename);
                $("#discription").val(pagedescription);

                $("#formsubmit").click(function () {
                    $("#myModal").modal("hide");
                    let name = document.getElementById("pagename").value;
                    let discription = document.getElementById("discription").value;
                    $.ajax({
                        url: "Component/28_Simple_CMS.cfc?method=update",
                        type: "post",
                        data: {
                            pageId: id,
                            pagename: name,
                            pagedescription: discription
                        },
                        success: function (data) {

                            let result = $(data).find("boolean").attr("value");
                            if (result) {
                                alert("Your Page Update Successfully");
                                //window.location.href = "28_admin.cfm";
                            }
                            else {
                                alert("Somrthing went Wrong..");
                            }
                        }
                    });
                });
            }
        });
    });

    $(".delete").click(function () {
        let id = $(this).data("pageid");
        $.ajax({
            url: "Component/28_Simple_CMS.cfc?method=getPageById",
            type: "get",
            data: {
                pageId: id
            },
            success: function (data) {
                var parsedData = JSON.parse(data);

                var pagename = parsedData.DATA[0][0];
                var pagedescription = parsedData.DATA[0][1];
                $("#title").text("Are you sure you want to Delete this Page").css("color", "red");
                $("#delete").show();
                $("#deletePage").modal("show");
                $("#delete-page").text(pagename);
                $("#delete-discription").text(pagedescription);

                $("#delete").click(function () {
                    $("#deletePage").modal("hide");
                    $.ajax({
                        url: "Component/28_Simple_CMS.cfc?method=delete",
                        type: "post",
                        data: {
                            pageId: id
                        },
                        success: function (data) {
                            let result = $(data).find("boolean").attr("value");
                            if (result) {
                                alert("Your Page Deleted Successfully");
                                window.location.href = "28_admin.cfm";
                            }
                            else {
                                alert("Somrthing went Wrong..");
                            }
                        }
                    });
                });
            }
        });
    });

    $(".view").click(function () {
        let id = $(this).data("pageviewid");
        $.ajax({
            url: "Component/28_Simple_CMS.cfc?method=getPageById",
            type: "get",
            data: {
                pageId: id
            },
            success: function (data) {
                var parsedData = JSON.parse(data);

                var pagename = parsedData.DATA[0][0];
                var pagedescription = parsedData.DATA[0][1];
                $("#title").text("THE PAGE VIEW").css({"color":"green","font-size":"25px"});
                $("#delete").hide();
                $("#deletePage").modal("show");
                $("#delete-page").text(pagename);
                $("#delete-discription").text(pagedescription);

            }
        });
    });
});

// function edit(id) {
    
//     $.ajax({
//         url: "Component/28_Simple_CMS.cfc?method=getPageById",
//         type: "get",
//         data: {
//             pageId: id
//         },
//         success: function (data) {
//             var parsedData = JSON.parse(data);


//             var pagename = parsedData.DATA[0][0];
//             var pagedescription = parsedData.DATA[0][1];

//             $("#addtitle").text("EDIT PAGE");
//             $("#myModal").modal("show");
//             $("#pagename").val(pagename);
//             $("#discription").val(pagedescription);

//             $("#formsubmit").click(function () {
//                 let name = document.getElementById("pagename").value;
//                 let discription = document.getElementById("discription").value;
//                 $.ajax({
//                     url: "Component/28_Simple_CMS.cfc?method=update",
//                     type: "post",
//                     data: {
//                         pageId: id,
//                         pagename: name,
//                         pagedescription: discription
//                     },
//                     success: function (result) {
//                         alert(result);
//                     }

//                 });
//             });
//         }
//     });
// }




function validateForm() {
    let pagename = document.getElementById("pagename").value.trim();
    let discription = document.getElementById("discription").value.trim();

    if (pagename.length === 0 || discription.length === 0) {
        showError("All fields are required.");
        return false; // Prevent form submission
    }

    return true;
}

function showError(message) {
    document.getElementById("error").textContent = message;
}

function clear() {
    alert("sdasdasifg");
}