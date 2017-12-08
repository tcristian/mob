import Storage from 'react-native-storage';
import { AsyncStorage } from 'react-native';

var storage = new Storage({
	size: 1000,
	storageBackend: AsyncStorage,
	defaultExpires: null,
	enableCache: true,
});
global.movies = storage;
/*
movies.clearMap();
movies.remove({
    key: 'movie'
})
var movie = {
    id: 1,
	title: 'Thor',
	year: 2011,
	description: "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    poster: "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
};

movies.save({
	key: 'movie',  // Note: Do not use underscore("_") in key!
	id: 1,	  // Note: Do not use underscore("_") in id!
	data: movie,
	expires: null
});
var movie = {
    id: 2,
	title: 'Thor 2',
	year: 2011,
	description: "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    poster: "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
};

movies.save({
	key: 'movie',  // Note: Do not use underscore("_") in key!
	id: 2,	  // Note: Do not use underscore("_") in id!
	data: movie,
	expires: null
});
*/
global.movies_list = [{
    "id": 0,
    "title": "Deadpool",
    "year": 2016,
    "description": "Deadpool tells the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.",
    "poster": "https://image.tmdb.org/t/p/w185/inVq3FRqcYIRl2la8iZikYYxFNR.jpg"
},{
    "id": 1,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 2,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 3,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 4,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 5,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 6,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 7,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 8,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 9,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
},{
    "id": 10,
    "title": "Thor: Ragnarok ",
    "year": 2017,
    "description": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.",
    "poster": "https://image.tmdb.org/t/p/w185/oSLd5GYGsiGgzDPKTwQh7wamO8t.jpg"
}];/*
movies.getAllDataForKey('movie').then(movs => {
    movs.forEach(movie => {
        var singleObj = {}
        singleObj['id'] = movie.id;
        singleObj['title'] = movie.title;
        singleObj['description'] = movie.description;
        singleObj['poster'] = movie.poster;
        singleObj['year'] = movie.year;
        movies_list.push(singleObj);

    })
})
*/
