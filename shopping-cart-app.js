const app = angular.module("shopping-cart-app", []);

app.controller("shopping-cart-ctrl", function($scope, $http) {
    /*Quản lý giỏ hàng*/


    $scope.cart = {
        items: [],
        // Thêm sản phẩm vào giỏ hàng 
        add(id) {
            var item = this.items.find(item => item.id == id) // kiểm tra trong giỏi hàng dựa vào id
            if (item) {
                item.qty++;
                this.saveToLocalStorage();
            } else {
                $http.get(`/rest/products/${id}`).then(resp => {
                    resp.data.qty = 1;
                    this.items.push(resp.data);
                    this.saveToLocalStorage();

                })
            }
        },
        // Xóa sản phẩm khỏi giỏ hàng 
        //Xoa san pham khoi gio hang
        remove(id) {
            var index = this.items.findIndex(item => item.id == id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },
        //xoa sach mat hang trong gio 
        /*clear() {
            this.items = [];
            this.saveToLocalStorage();
        },*/
        // Tính thành tiền của 1 sản phẩm
       // amt_of(item) {},
        // Tính tổng số lượng các mặt hàng trong gió
        get count() {
            return this.items
                .map(item => item.qty)
                .reduce((total, qty) => total += qty, 0);
        },
        // Tổng thành tiền các mặt hàng trong giỏ
        /*get amount() {
            return this.items
                .map(item => item.qty * item.price)
                .reduce((total, qty) => total += qty, 0)
        },*/
         // Lưu giỏ hàng vào local storage 
    saveToLocalStorage() {
        var json = JSON.stringify(angular.copy(this.items));
        localStorage.setItem("cart", json);
    },
    // Đọc giỏ hàng từ local storage 
    loadFromLocalStorage() {
        var json = localStorage.getItem("cart");
        this.items = json ? JSON.parse(json) : [];
    }
    
    /**/
    }
    $scope.cart.loadFromLocalStorage();
})