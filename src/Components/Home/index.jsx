import React from 'react';
import styled from 'styled-components';
import { withTheme } from '@material-ui/core';

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

const Home = ({ theme }) => (
  <>
    <Section>
      <Header />
    </Section>
    <Section main>
      <DiningRooms />
      <Feedback />
    </Section>
  </>
);

export default withTheme()(Home);
