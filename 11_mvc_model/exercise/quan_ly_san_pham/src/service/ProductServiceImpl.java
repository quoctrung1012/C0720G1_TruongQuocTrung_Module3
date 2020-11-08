package service;

import model.Product;

import java.util.*;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products;
    static {
        products  = new HashMap<>();
        products.put(1,new Product(1, "SamSung Note 5", 200.5, "SamSung","smartphone"));
        products.put(2,new Product(2, "SamSung Note 6", 200.5, "SamSung","smartphone"));
        products.put(3,new Product(3, "SamSung Note 7", 200.5, "SamSung","smartphone"));
        products.put(4,new Product(4, "SamSung Note 8", 200.5, "SamSung","smartphone"));
        products.put(5,new Product(5, "SamSung Note 9", 200.5, "SamSung","smartphone"));
        products.put(6,new Product(6, "SamSung Note 10", 200.5, "SamSung","smartphone"));
        products.put(7,new Product(7, "SamSung Note 11", 200.5, "SamSung","smartphone"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        Set<Integer> keySet = products.keySet();
        for (Integer key : keySet) {
            if (products.get(key).getName().contains(name)) {
                productList.add(products.get(key));
            }
        }
        return productList;
    }
}
