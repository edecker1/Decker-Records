/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

/**
 *
 * @author super computer 2.0
 */
public class Item {
  String title;
  String artist;
  String genre;
  String price;
  String imageURL;
  String quantity;

  Item(String title, String artist, String genre, String price, String image, String quantity) {
    this.title = title;
    this.artist = artist;
    this.genre = genre;
    this.price = price;
    this.imageURL = image;
    this.quantity = quantity;
  }
}


