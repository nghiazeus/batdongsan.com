/**
 * 
 */
var chatWidget = document.getElementById("chat-widget");
var chatOpenBtn = document.getElementById("open-chat");

chatOpenBtn.addEventListener("click", function() {
    if (chatWidget.classList.contains("hidden")) {
        chatWidget.classList.remove("hidden");
        chatWidget.classList.add("visible");
    } else {
        chatWidget.classList.remove("visible");
        chatWidget.classList.add("hidden");
    }
});

document.getElementById("chat-close").addEventListener("click", function() {
    chatWidget.classList.remove("visible");
    chatWidget.classList.add("hidden");
});

document.getElementById("chat-send").addEventListener("click", function() {
    sendMessage("user");
});

document.getElementById("chat-input").addEventListener("keypress", function(event) {
    if (event.keyCode === 13) {
        sendMessage("user");
        event.preventDefault();
    }
});

function sendMessage(sender) {
    var messageInput = document.getElementById("chat-input");
    var message = messageInput.value.trim();

    if (message !== "") {
        var chatMessages = document.getElementById("chat-messages");
        var newMessage = document.createElement("li");

        var messageText = document.createElement("span");
        messageText.innerText = message;

        var messageInfo = document.createElement("span");
        messageInfo.classList.add("message-info");
        messageInfo.innerText = " - " + sender;

        newMessage.appendChild(messageText);
        newMessage.appendChild(messageInfo);

        if (sender === "user") {
            newMessage.classList.add("user-message");
        } else {
            newMessage.classList.add("admin-message");
        }

        chatMessages.appendChild(newMessage);
        messageInput.value = "";
        messageInput.focus();
    }
}

Tabs

function openTab(event, tabId) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(tabId).style.display = "block";
    event.currentTarget.className += " active";
}

// Mở tab 1 mặc định khi trang web được tải lần đầu
document.getElementById("tab1").style.display = "block";


//Fillter giá nhà

$(document).ready(function() {
    // Lấy giá trị mặc định từ input fields
    var minPrice = parseInt($("input[name='min']").val());
    var maxPrice = parseInt($("input[name='max']").val());

    // Khởi tạo slider
    $(".range-slider").slider({
        range: true, // Cho phép chọn khoảng giá trị
        min: 0, // Giá trị nhỏ nhất
        max: 200, // Giá trị lớn nhất
        values: [minPrice, maxPrice], // Giá trị ban đầu
        slide: function(event, ui) {
            // Cập nhật giá trị min/max cho input fields
            $("input[name='min']").val(ui.values[0]);
            $("input[name='max']").val(ui.values[1]);
        }
    });
});



// --------------------

//