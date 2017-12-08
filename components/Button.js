import React from 'react';
import {
    StyleSheet,
    Text,
    TouchableOpacity
} from 'react-native';

const Button = ({onPress, children }) => {
    return (
        <TouchableOpacity onPress={onPress} style={styles.button}>
            <Text style={styles.text}>{ children }</Text>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    button: {
        marginTop: 10,
        padding: 20,
        width: 120,
        backgroundColor: '#00aeef',
        borderRadius: 4,
        alignItems: 'center',
        marginLeft: 2.5,
        marginRight: 2.5
    },
    text: {
        color: '#ffffff',
        fontWeight: '700',
        fontSize: 18,

    }
});
export { Button };
