import React from 'react';
import styled from 'styled-components';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHamburger } from '@fortawesome/free-solid-svg-icons';
import Typography from '@material-ui/core/Typography';
import { withTheme } from '@material-ui/core';

const Container = styled.header`
    display: flex;
    max-width: 1200px;
    justify-content: space-around;
    align-items: center;
    min-height: 64px;
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
