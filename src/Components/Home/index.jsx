import React from 'react';
import styled from 'styled-components';

import Layout from '../Layout';
import Header from './Header';
import DiningRooms from './DiningRooms';
import Feedback from './Feedback';
import MainSection from '../MainSection';
import background from './Header/header-background.svg';

const Container = styled.div`
  display: flex;
  flex-direction: column;
  align-items: stretch;
`;

const HeaderSection = styled.section`
  margin-top: 64px;
  background-image: url("${background}");
  background-size: contain;
  background-repeat: no-repeat;

  @media screen and (min-width: 1200px) {
    background-size: cover;
  }
`;

const Home = () => (
  <Layout>
    <Container>
      <HeaderSection>
        <Header />
      </HeaderSection>
      <MainSection>
        <DiningRooms />
        <Feedback />
      </MainSection>
    </Container>
  </Layout>
);

export default Home;
