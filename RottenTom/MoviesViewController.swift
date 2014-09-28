//
//  MoviesViewController.swift
//  RottenTom
//
//  Created by Paul L on 9/27/14.
//  Copyright (c) 2014 ICH. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var movies: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //  Display a default or loading view

        var url =  "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=85r2e6nhsy9858gb4t2ymrxg&limit=20&country=us"
        var request = NSURLRequest(URL: NSURL(string: url))
        NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue.mainQueue(),
            completionHandler:{ (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
                
            // Hide the loading view
                
            var  object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            
            println("object: \(object)")
            
            self.movies = object["movies"] as [NSDictionary]
            
                self.tableView.reloadData()
                
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("I'm at row: \(indexPath.row), section: \(indexPath.section)")

        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        
        var movie = movies[indexPath.row]
        
        cell.MovieTitleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        
        var posters = movie["posters"] as NSDictionary
        var posterURL = posters["thumbnail"] as String
        
        cell.posterView.setImageWithURL(NSURL(string: posterURL))

        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
