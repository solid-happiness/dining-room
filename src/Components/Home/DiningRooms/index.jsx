import React from 'react';
import styled from 'styled-components';
import { withRouter } from 'react-router-dom';
import { withTheme } from '@material-ui/core';
import Button from '@material-ui/core/Button';

import coffeeIcon from './coffee-icon.svg';
import dumplingIcon from './dumpling-icon.svg';
import hotDishIcon from './hot-dish-icon.svg';

const diningRooms = [
  { 
    name: 'Кафетерий',
    icon: coffeeIcon,
    slug: 'coffee',
  },
  { 
    name: 'Пельменная',
    icon: dumplingIcon,
    slug: 'dumpling',
  },
  { 
    name: 'Столовая',
    icon: hotDishIcon,
    slug: 'hot-dish',
  }
];

const Container = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  margin: 50px 0;
`;

const Item = styled.div`
  flex: 1;
  width: 300px;
  height: 300px;
  border: 1px #484848 dashed;
  border-radius: 50%;
  overflow: hidden;
  background-image: ${({ icon }) => `url("${icon}")`};
  background-position: center;
  background-repeat: no-repeat;
  background-size: 150px;
  margin-bottom: 50px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  padding: 18px 0 25px 0;
`;

const Title = styled.header`
  color: ${({ color }) => color};
  font-weight: bold;
  font-family: "Amatic SC";
  font-size: 3rem;
`;

const DiningRooms = ({ theme, history }) => (
    <Container>
      {diningRooms.map(({ name, icon, slug }) => (
        <Item
          icon={icon}
          alt={name}
          key={slug}
          color={theme.palette.secondary.main}
        >
          <Title color={theme.palette.primary.main}>
            {name}
          </Title>
          <Button
            variant="contained"
            color="primary"
            onClick={() => history.push(`/${slug}/`)}
          >
            Описание
          </Button>
        </Item>
      ))}
    </Container>
);

export default withRouter(withTheme()(DiningRooms));
