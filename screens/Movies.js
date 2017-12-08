import React, { Component } from 'react';
import {
    TouchableOpacity,
    Text,
    StyleSheet,
    ScrollView,
    View,
    RefreshControl
} from 'react-native'
import { Actions } from 'react-native-router-flux'
import { List, ListItem } from 'react-native-elements'
import '../config/storage.js'
export default class Movies extends Component {
    goToHome(){
        Actions.home()
    }
    goToItem(item, i){
        Actions.movieDetails({movie: item, fi: i})
    }
    render() {
        return (
            <ScrollView>
            <List>
              {
                movies_list.map((l, i) => (
                  <ListItem  onPress={() => this.goToItem(l, i)}
                    //roundAvatar
                    avatar={
                        {uri:l.poster}
                    }
                    key={i}
                    title={l.title}
                    titleStyle={{marginTop:0}}
                    subtitle={l.description}
                    subtitleStyle={{fontSize:11}}
                    subtitleNumberOfLines={4}
                    avatarContainerStyle={{width:50, height:80, marginTop: 0}}
                    avatarStyle={{width:60,height:90}}
                    containerStyle={{height:100}}
                    rightIcon={{ name: 'arrow-right', type: 'font-awesome', style: { marginRight: 1, fontSize: 20 } }}

                  />
                ))
              }
            </List>

            </ScrollView>
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
