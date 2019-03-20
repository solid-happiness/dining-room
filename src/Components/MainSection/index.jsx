import styled from 'styled-components';
import background from './background.svg';

const MainSection = styled.section`
  flex: 1;
  padding: 64px 0;
  background-image: url("${background}");
  background-size: cover;
`;

export default MainSection;
