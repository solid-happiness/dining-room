import React from 'react';
import styled from 'styled-components';
import { withTheme } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import background from './background.svg';

const Container = styled.section`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 300px;
  background-image: url("${background}");
  background-size: contain;
  background-repeat: no-repeat;
  max-height: calc(100vh - 64px);
  margin: 50px 0;
`;

const Title = styled.header`
  font-size: 25vw;
  font-family: 'Amatic SC';
  color: ${({ color }) => color};
`;

const Slogan = styled(Typography)`
  && {
    font-size: 1rem;
  }
`;

const Header = ({ theme }) => (
    <Container>
      <Title
        color={theme.palette.primary.main}
      >
        ПОХАВАЙ!
      </Title>
      <Slogan>самый вкусный сайт</Slogan>
    </Container>
)

export default withTheme()(Header);
