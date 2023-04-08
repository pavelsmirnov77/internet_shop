package com.example.internet_shop.services;

import com.example.internet_shop.models.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {
    private final List<Product> products = new ArrayList<>();
    private long ID = 0;
    {
        products.add(new Product(++ID, "Playstation 5", "Simple description", 24000, "Cherepovec", "Pavel"));
    }
    public List<Product> listProducts() {
        return products;
    }
    public void saveProduct(Product product) {
        product.setId(++ID);
        products.add(product);
    }
    public void deleteProducts(Long id) {
        products.removeIf(product -> product.getId().equals(id));
    }

    public Product getProductById(Long id) {
        for (Product product : products) {
            if (product.getId().equals(id)) return product;
        }
        return null;
    }
}
