import React, { Component } from 'react';
import { TouchableOpacity, Text, StyleSheet, View } from 'react-native';
import { Actions } from 'react-native-router-flux';
import * as firebase from 'firebase'
import { Input } from '../components/Input'
import { Button } from '../components/Button'
import Spinner from 'react-native-loading-spinner-overlay';
import BottomNavigation, { Tab } from 'react-native-material-bottom-navigation'
import Icon from 'react-native-vector-icons/MaterialIcons'

export default class Home extends Component {
    state = {
        email: '',
        password: '',
        authenticating: true,
        message: '',
        visible: true
    }
    goToMovies(){
        Actions.movies()
    }
    goToSeries(){
        Actions.series()
    }
    goToSupport(){
        Actions.support()
    }
    componentWillMount(){
        const firebaseConfig = {
            apiKey: 'AIzaSyDT7f1mgyEffrNVCtPAclDzAxu-rYOD3Qs',
            authDomain: 'ios-mdb.firebaseapp.com',
        }
        firebase.initializeApp(firebaseConfig)
    }
    onLoginPress() {
        this.setState({
            message: '',
            authenticating: true
        });
        const {
            email,
            password
        } = this.state;
        firebase.auth().signInWithEmailAndPassword(email, password)
            .then(() => {
                this.setState({
                    message: 'Successfully logged in.',
                    authenticating: true,
                    visible: false
                });

            })
            .catch(() => {
                //Login was not successful, let's create a new account
                firebase.auth().createUserWithEmailAndPassword(email, password)
                    .then(() => {
                        this.setState({
                            message: 'Account was created with success.',
                            authenticating: false,
                            visible: false
                        });
                    })
                    .catch(() => {
                        this.setState({
                            message: 'There was a problem when we tried to create the account.',
                            authenticating: false
                        })
                    });
            });
    }
    onPressSingIn(){
        this.setState({
            authenticating: true
        })
    }
    goTo(index){
        if(index == 0)
            Actions.movies();
        else if(index == 1)
            Actions.series();
        else if(index == 2)
            Actions.support();

    }
    renderCurrentState(){
        if(this.state.authenticating){
            return(
                <View style={styles.container}>
                    <BottomNavigation
                        labelColor="white"
                        rippleColor="white"
                        backgroundColor="#0397D6"
                        style={{height: 56, position: 'absolute', left: 0, bottom: 0, right: 0 }}
                        onTabChange={(newTabIndex) => this.goTo(newTabIndex)}                >
                    <Tab
                      label="Movies"
                      icon={<Icon size={24} color="white" name="movie" />}
                    />
                    <Tab
                      label="Series"
                      icon={<Icon size={24} color="white" name="tv"  />}
                    />
                    <Tab
                      label="Support"
                      icon={<Icon size={24} color="white" name="mail" />}
                    />
                  </BottomNavigation>
                </View>
            )
        }
        return(
            <View style={styles.container}>
                <Input
                    placeholder='Your email..'
                    label='Email'
                    onChangeText={email=>this.setState({ email })}
                    value={this.state.email}
                />
                <Input
                    placeholder='Your password..'
                    label='Password'
                    secureTextEntry
                    onChangeText={password => this.setState({ password })}
                    value={this.state.password}
                    //value='packardbell'
                />
                <Button onPress={() => this.onLoginPress()}>Login</Button>
                <Text>Asd: {this.state.message}</Text>
            </View>

        )
    }

    render() {
        return (
            <View style={styles.container}>
                {this.renderCurrentState()}

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
