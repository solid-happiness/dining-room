import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import { withRouter } from 'react-router-dom';
import { withTheme } from '@material-ui/core';
import Button from '@material-ui/core/Button';

const Container = styled.div`
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin: 50px auto;
  max-width: 1200px;
  
  @media screen and (max-width: 920px) {
    flex-direction: column;
  }
`;

const Item = styled.div`
  width: 300px;
  height: 300px;
  border: 1px #484848 dashed;
  border-radius: 50%;
  overflow: hidden;
  background-image: ${({ icon }) => `url("${icon}")`};
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  margin-bottom: 50px;
  display: flex;
  flex-direction: column;
  align-items: centser;
  justify-content: space-between;
  padding: 18px 0 25px 0;
`;

const Title = styled.header`
  color: white;
  font-weight: bold;
  font-family: "Amatic SC";
  font-size: 3rem;
  text-align: center;
`;

const loadDiningRooms = async (setDiningRooms) => {
  const { eateries } = await (await fetch('/api/eateries/')).json();

  setDiningRooms(eateries);
};

const DiningRooms = ({ theme, history }) => {
  React.useEffect(() => {
    document.title = 'Похавай!';
  }, []);

  const [diningRooms, setDiningRooms] = React.useState([]);
  React.useEffect(() => {
    loadDiningRooms(setDiningRooms);
  }, []);

  return (
    <Container>
      {diningRooms.map(({
        id,
        name,
        photo,
        slug,
      }) => (
        <Item
          icon={photo}
          alt={name}
          key={id}
          color={theme.palette.secondary.main}
        >
          <Title>
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
};

DiningRooms.propTypes = {
  theme: PropTypes.object.isRequired,
  history: PropTypes.object.isRequired,
};

export default withRouter(withTheme()(DiningRooms));