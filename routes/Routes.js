import React from 'react'
import { Router, Scene } from 'react-native-router-flux'
import Home from '../screens/Home.js'
import Series from '../screens/Series.js'
import Movies from '../screens/Movies.js'
import MovieDetails from '../screens/MovieDetails.js'
import Support from '../screens/Support.js'


const Routes = () => (
   <Router>
      <Scene key = "root">
         <Scene key="home" component = {Home} title = "Home" initial = {true} />
         <Scene key="movies" component = {Movies} title = "Movies" />
         <Scene key="series" component = {Series} title = "Series" />
         <Scene key="support" component = {Support} title = "Support" />
         <Scene key="movieDetails" component = {MovieDetails} title = "Movie Details" />
      </Scene>
   </Router>
)
export default Routes
