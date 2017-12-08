import React, { Component } from 'react';
import { TouchableOpacity, Text, Platform, Linking } from 'react-native'
import { Actions } from 'react-native-router-flux'
var Mailer = require('NativeModules').RNMail;

export default class Support extends Component {
    pressed(){
        if (Platform.OS === 'ios') {
            const inbox =  Linking.canOpenURL('inbox-gmail:');
            if (inbox) {
                Linking.openURL('mailto:cristiantimar@gmail.com&subject=Salut&body=example');
            } else {
                Linking.openURL('message:');
            }
        } else if (Platform.OS === 'android') {

        }
        else{
        }
    }
    render() {
        return (
            <TouchableOpacity style = {{ margin: 128 }} onPress = {() => this.pressed()}>
               <Text>Series Page</Text>
            </TouchableOpacity>
        );
    }
}
