/**
 * 
 */

// Lấy phần tử p và danh sách ul bằng cách sử dụng document.getElementById()
var hoverContainer = document.getElementById('hoverContainer');
var hoverList = document.getElementById('hoverList');

// Gắn sự kiện "mouseover" và "mouseout" vào phần tử p
hoverContainer.addEventListener('mouseover', function() {
    // Hiển thị danh sách khi di chuột vào
    hoverList.style.display = 'block';
});

hoverContainer.addEventListener('mouseout', function() {
    // Ẩn danh sách khi di chuột ra
    hoverList.style.display = 'none';
});

// Gắn sự kiện "click" vào từng item trong danh sách
var items = hoverList.getElementsByTagName('li');
for (var i = 0; i < items.length; i++) {
    items[i].addEventListener('click', function() {
        // Xử lý khi người dùng lựa chọn một item
        var selectedItem = this.innerText;
        console.log('Đã chọn:', selectedItem);

        // Ẩn danh sách sau khi lựa chọn
        hoverList.style.display = 'none';
    });
}