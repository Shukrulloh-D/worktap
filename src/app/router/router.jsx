import { createBrowserRouter } from 'react-router-dom';
import { MainLayout } from 'app/layouts';
import { HomePage } from 'pages/home';
import { ExchangePage } from 'pages/exchange';
import { WorksPage } from 'pages/works';
import { ContestsPage } from 'pages/contests';
import { CreateWorkPage } from 'pages/create-work';
import { CreateOrderPage } from 'pages/create-order';
import { ProfilePage } from 'pages/profile';
import { ChatPage } from 'pages/chat';
import { WalletPage } from 'pages/wallet';
import { PurchasesPage } from 'pages/purchases';
import { MyOrdersPage } from 'pages/my-orders';
import { FavoritesPage } from 'pages/favorites';
import { NotFoundPage } from 'pages/not-found';
export const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'exchange', element: <ExchangePage /> },
      { path: 'works', element: <WorksPage /> },
      { path: 'contests', element: <ContestsPage /> },
      { path: 'create-work', element: <CreateWorkPage /> },
      { path: 'create-order', element: <CreateOrderPage /> },
      { path: 'profile', element: <ProfilePage /> },
      { path: 'chat', element: <ChatPage /> },
      { path: 'wallet', element: <WalletPage /> },
      { path: 'purchases', element: <PurchasesPage /> },
      { path: 'my-orders', element: <MyOrdersPage /> },
      { path: 'favorites', element: <FavoritesPage /> },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
]);
