//
//  HomeViewController.swift
//  mdb
//
//  Created by Timar Cristian on 02/11/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet var moviesTapped: UIButton!
    var movies = [Movie]()
    var m1 = Movie(title: "Deadpool", poster: "https://image.tmdb.org/t/p/w185/qbcpGKXQlG7UJHgmA14jYz6PXRr.jpg", year: 2016, desc: "Deadpool tells the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.", type: "movie")
    var m2 = Movie(title: "Thor: Ragnarok", poster: "https://image.tmdb.org/t/p/w185/avy7IR8UMlIIyE2BPCI4plW4Csc.jpg", year: 2017, desc: "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.", type: "movie")
    var m3 = Movie(title: "Ex Machina", poster: "https://image.tmdb.org/t/p/w185/btbRB7BrD887j5NrvjxceRDmaot.jpg", year: 2015, desc: "Caleb, a 26 year old coder at the world's largest internet company, wins a competition to spend a week at a private mountain retreat belonging to Nathan, the reclusive CEO of the company. But when Caleb arrives at the remote location he finds that he will have to participate in a strange and fascinating experiment in which he must interact with the world's first true artificial intelligence, housed in the body of a beautiful robot girl.", type: "movie")
    var m4 = Movie(title: "Elysium ", poster: "https://image.tmdb.org/t/p/w185/tHkjoAxmhp3Eau1h0Ir7maKMwUz.jpg", year: 2013, desc: "In the year 2159, two classes of people exist: the very wealthy who live on a pristine man-made space station called Elysium, and the rest, who live on an overpopulated, ruined Earth. Secretary Rhodes (Jodie Foster), a hard line government ofﬁcial, will stop at nothing to enforce anti-immigration laws and preserve the luxurious lifestyle of the citizens of Elysium. That doesn’t stop the people of Earth from trying to get in, by any means they can. When unlucky Max (Matt Damon) is backed into a corner, he agrees to take on a daunting mission that, if successful, will not only save his life, but could bring equality to these polarized worlds.", type: "movie")
    var m5 = Movie(title: "Avatar", poster: "https://image.tmdb.org/t/p/w185/kmcqlZGaSh20zpTbuoF0Cdn07dT.jpg", year: 2009, desc: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.", type: "movie")
    var m6 = Movie(title: "It", poster: "https://image.tmdb.org/t/p/w1280/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg", year: 2017, desc: "In a small town in Maine, seven children known as The Losers Club come face to face with life problems, bullies and a monster that takes the shape of a clown called Pennywise.", type: "movie")
    var m7 = Movie(title: "Happy Death Day", poster: "https://image.tmdb.org/t/p/w1280/cTaEIUYTt52ooq9quVbAQ7NpGwo.jpg", year: 2017, desc: "A college student relives the day of her murder over and over again as she tries to discover her killer's identity.", type: "movie")
    var m8 = Movie(title: "Geostorm", poster: "https://image.tmdb.org/t/p/w1280/nrsx0jEaBgXq4PWo7SooSnYJTv.jpg", year: 2017, desc: "Gerard Butler playing a stubborn but charming satellite designer who, when the world’s climate-controlling satellites malfunction, has to work together with his estranged brother to save the world from a man-made storm of epic proportions. A trip into space follows, while on Earth a plot to assassinate the president begins to unfold.", type: "movie")
    var m9 = Movie(title: "Wonder Woman", poster: "https://image.tmdb.org/t/p/w1280/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg", year: 2017, desc: "An Amazon princess comes to the world of Man to become the greatest of the female superheroes.", type: "movie")
    var m10 = Movie(title: "The Hunger Games: Mockingjay - Part 1", poster: "https://image.tmdb.org/t/p/w1280/gj282Pniaa78ZJfbaixyLXnXEDI.jpg", year: 2014, desc: "Katniss Everdeen reluctantly becomes the symbol of a mass rebellion against the autocratic Capitol.", type: "movie")
    override func viewDidLoad() {
        super.viewDidLoad()
        movies.append(m1!)
        movies.append(m2!)
        movies.append(m3!)
        movies.append(m4!)
        movies.append(m5!)
        movies.append(m6!)
        movies.append(m7!)
        movies.append(m8!)
        movies.append(m9!)
        movies.append(m10!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        let detailVC = segue.destination as! MoviesTableViewController
        detailVC.movies = movies
    }
    
    @IBAction func moviesTappedAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToMovies", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
