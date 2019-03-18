import React from 'react';
import styled from 'styled-components';

import Layout from '../Layout';
import Header from './Header';
import DiningRooms from './DiningRooms';
import Feedback from './Feedback';
import MainSection from '../MainSection';

const Section = styled.section`
  margin: 64px 0;
`;

const Home = () => (
  <Layout>
    <Section>
      <Header />
    </Section>
    <MainSection>
      <DiningRooms />
      <Feedback />
    </MainSection>
  </Layout>
);

export default Home;
