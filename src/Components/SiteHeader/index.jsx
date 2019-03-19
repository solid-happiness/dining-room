import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
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

const Delivery = styled(Typography)`
    && {
        margin-right: 15px;
    }
`;

const SiteHeader = ({ theme }) => (
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
            <Delivery
                variant="body1"
                inline
            >
                Доставка
            </Delivery>
            <Typography
                variant="body1"
                inline
            >
                Калькулятор калорий
            </Typography>
        </Menu>
    </Container>
)

export default withTheme()(SiteHeader);
