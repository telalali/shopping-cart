// CountryProvider.java
package com.shoppingcart.service;

import com.shoppingcart.model.Country;

import java.util.ArrayList;
import java.util.List;

public class CountryProvider {
    public static List<Country> getCountries() {
        List<Country> countries = new ArrayList<>();
        countries.add(new Country(1, "Canada"));
        countries.add(new Country(2, "USA"));
        countries.add(new Country(3, "SUDAN"));
        // Add more countries as needed

        return countries;
    }
}
