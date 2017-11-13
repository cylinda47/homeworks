import { createStore } from `redux`;
import reducer from './reducer.js';

const store = createStore(reducer);

// actions/fruit_actions.js

const addOrange = {
	type: "ADD_FRUIT",
	fruit: "orange"
};

store.dispatch(addOrange);
store.getState(); // ['orange']

// actions/fruit_actions.js

const addFruit = fruit => ({
	type: "ADD_FRUIT",
	fruit
});

store.dispatch(addFruit("Apple"));
store.dispatch(addFruit("Strawberry"));
store.dispatch(addFruit("Lychee"));
store.getState(); // [ 'orange', 'apple', 'strawberry', 'lychee' ]

// root.jsx
import React from 'react';
import { Provider } from 'react-redux';
import App from './app.jsx';

const Root = ({ store }) => (
  <Provider store={store}>
    <App />
  </Provider>
);

export default Root;

// entry.js
import React from 'react';
import ReactDOM from 'react-dom';

import { createStore } from 'redux';
import reducer from './reducer.js';
import Root from './root.jsx';

document.addEventListener('DOMContentLoaded', () => {
  const store = createStore(reducer);
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
