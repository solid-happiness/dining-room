import React from 'react';
import styled from 'styled-components';

import Layout from '../Layout';
import Header from './Header';
import DiningRooms from './DiningRooms';
import Feedback from './Feedback';
import mainBackground from './main-background.svg';

const Section = styled.section`
  margin: 50px 0;
  ${({ main }) => main && `
    background-image: url("${mainBackground}");
    background-size: cover;
  `}
`;

const Home = () => (
  <Layout>
    <Section>
      <Header />
    </Section>
    <Section main>
      <DiningRooms />
      <Feedback />
    </Section>
  </Layout>
);

export default Home;
