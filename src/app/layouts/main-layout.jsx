import { useState } from 'react';
import { Outlet } from 'react-router-dom';
import { Header } from 'widgets/header';
import { Footer } from 'widgets/footer';
import { AuthModals } from 'widgets/auth-modals';
import { InfoModals } from 'widgets/info-modals';
export const MainLayout = () => {
  const [authOpen, setAuthOpen] = useState(false);
  const [authMode, setAuthMode] = useState('login');
  const [info, setInfo] = useState(null);
  return (
    <div>
      <Header onOpenAuth={(m) => { setAuthMode(m || 'login'); setAuthOpen(true); }} onOpenInfo={setInfo} />
      <main><Outlet /></main>
      <Footer />
      <AuthModals isOpen={authOpen} mode={authMode} onClose={() => setAuthOpen(false)} onSwitch={(m) => setAuthMode(m)} />
      <InfoModals type={info} onClose={() => setInfo(null)} />
    </div>
  );
};
