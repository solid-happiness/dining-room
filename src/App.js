import React from 'react';
import { createGlobalStyle } from 'styled-components';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import CssBaseline from '@material-ui/core/CssBaseline';
import { createMuiTheme, MuiThemeProvider } from '@material-ui/core/styles';
import Home from './Components/Home';
import SiteHeader from './Components/SiteHeader';
import Footer from './Components/Footer';

const GlobalStyles = createGlobalStyle`
  @import url('https://fonts.googleapis.com/css?family=Roboto');
  @import url('https://fonts.googleapis.com/css?family=Amatic+SC');
`;

const theme = createMuiTheme({
  palette: {
    primary: {
      main: '#283583',
    },
    secondary: {
      main: '#EB5B49',
    }
  },
  typography: {
    useNextVariants: true,
  }
})

const App = () => (
  <>
    <CssBaseline />
    <GlobalStyles />
    <MuiThemeProvider theme={theme}>
      <SiteHeader />
      <Router>
        <Route path="/" component={Home} exact />
      </Router>
      <Footer />
    </MuiThemeProvider>
  </>
)

export default App;
