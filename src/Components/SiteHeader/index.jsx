import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import Dialog from '@material-ui/core/Dialog';
import Button from '@material-ui/core/Button';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContentText from '@material-ui/core/DialogContentText';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faHamburger } from '@fortawesome/free-solid-svg-icons';
import Typography from '@material-ui/core/Typography';
import { withTheme } from '@material-ui/core';

const Container = styled.header`
    display: flex;
    justify-content: space-around;
    align-items: center;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 64px;
    background: rgb(250, 250, 250);
    z-index: 5;
`;

const HomePageLink = styled(Link)`
    text-decoration: none;
`;

const Logo = styled.aside`
    display: flex;
    align-items: center;
`;

const LogoIcon = styled(FontAwesomeIcon)`
    && {
        margin-right: 5px;
    }
`;

const Menu = styled.aside`
    display: flex;

    @media screen and (max-width: 720px) {
        display: none;
    }
`;

const AlertMessage = styled(DialogContentText)`
    && {
        width: 350px;
        margin: 15px 25px 10px 25px;
    }
`;

const SiteHeader = ({ theme }) => {
  const [alertMessage, setAlertMessage] = React.useState('');
  const showAlert = alertMessage !== '';

  return (
    <Container>
      <HomePageLink to="/">
        <Logo>
          <LogoIcon
            icon={faHamburger}
            color={theme.palette.primary.main}
          />
          <Typography
            variant="h6"
            inline
          >
            МГТУ им. Н.Э. Баумана
          </Typography>
        </Logo>
      </HomePageLink>
      <Menu>
        <Button onClick={() => setAlertMessage('Данный функционал пока что не доступен, но будет реализован в ближайшее время')}>
          Доставка
        </Button>
        <Button>
          Калькулятор калорий
        </Button>
      </Menu>
      <Dialog open={showAlert}>
        <AlertMessage>
          <Typography>
            {alertMessage}
          </Typography>
        </AlertMessage>
        <DialogActions>
          <Button>OK</Button>
        </DialogActions>
      </Dialog>
    </Container>
  );
};

SiteHeader.propTypes = {
  theme: PropTypes.object.isRequired,
};

export default withTheme()(SiteHeader);
