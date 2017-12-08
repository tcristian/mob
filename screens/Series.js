import React, { Component } from 'react';
import { TouchableOpacity, Text } from 'react-native'
import { Actions } from 'react-native-router-flux'

export default class Series extends Component {
    goToHome(){
        Actions.home()
    }
    render() {
        return (
            <TouchableOpacity style = {{ margin: 128 }} onPress = {() => this.goToHome()}>
               <Text>Series Page</Text>
            </TouchableOpacity>
        );
    }
}
