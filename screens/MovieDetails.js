import React, { Component } from 'react';
import { View, Text, ScrollView, StyleSheet } from 'react-native'
import { Actions } from 'react-native-router-flux'
import { List, ListItem } from 'react-native-elements'
import { Input } from '../components/Input'
import { Button } from '../components/Button'
import '../config/storage.js'

export default class MovieDetails extends Component {
    state = {
        title: this.props.movie.title,
        description: this.props.movie.description,
    }
    updateMovie(){
        const {
            title,
            description
        } = this.state;
        for(let i = 0; i < movies_list.length; i++){
            if(i == this.props.fi){
                movies_list[i].title = title
                movies_list[i].description = description
                /*var movie = {
                    id: movies_list[i].id,
                	title: title,
                	year: movies_list[i].year,
                	description: description,
                    poster: movies_list[i].poster
                }
                movies.remove({
                	key: 'movie',
                	id: movies_list[i].id
                });
                movies.save({
                	key: 'movie',  // Note: Do not use underscore("_") in key!
                	id: i,	  // Note: Do not use underscore("_") in id!
                	data: movie,
                	expires:null
                });*/
            }
        }
        Actions.movies();

    }
    render() {
        return (
            <View style={styles.container}>
                <Input
                    placeholder='Your email..'
                    label='Email'
                    onChangeText={title=>this.setState({ title })}
                    value={this.state.title}
                />
                <Input
                    placeholder='Your password..'
                    label='Password'
                    onChangeText={description => this.setState({ description })}
                    value={this.state.description}
                    //value='packardbell'
                />
                <Button onPress={() => this.updateMovie()}>Update</Button>
            </View>

        );
    }
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
    width: '100%'
  },
});
