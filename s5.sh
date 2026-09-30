# ========= ROUTER =========
cat > src/app/router/router.jsx << 'END'
import { createBrowserRouter } from 'react-router-dom';
import { MainLayout } from 'app/layouts/main-layout';
import { AuthLayout } from 'app/layouts/auth-layout';
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
import { WorkDetailPage } from 'pages/work-detail';
import { OrderFreelancerPage } from 'pages/order-freelancer';
import { OrderBidPage } from 'pages/order-bid';
import { OrderOwnerPage } from 'pages/order-owner';
import { ContestFreelancerPage } from 'pages/contest-freelancer';
import { ContestBidPage } from 'pages/contest-bid';
import { ContestTakePartPage } from 'pages/contest-take-part';
import { ContestOwnerPage } from 'pages/contest-owner';
import { LoginPage } from 'pages/login';
import { SignupPage } from 'pages/signup';
import { ResetPasswordPage } from 'pages/reset-password';
import { NewPasswordPage } from 'pages/new-password';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'exchange', element: <ExchangePage /> },
      { path: 'works', element: <WorksPage /> },
      { path: 'works/:id', element: <WorkDetailPage /> },
      { path: 'contests', element: <ContestsPage /> },
      { path: 'contests/:id', element: <ContestFreelancerPage /> },
      { path: 'contests/:id/bid', element: <ContestBidPage /> },
      { path: 'contest-take-part', element: <ContestTakePartPage /> },
      { path: 'contest-owner', element: <ContestOwnerPage /> },
      { path: 'create-work', element: <CreateWorkPage /> },
      { path: 'create-order', element: <CreateOrderPage /> },
      { path: 'orders/:id', element: <OrderFreelancerPage /> },
      { path: 'orders/:id/bid', element: <OrderBidPage /> },
      { path: 'orders/:id/owner', element: <OrderOwnerPage /> },
      { path: 'profile', element: <ProfilePage /> },
      { path: 'chat', element: <ChatPage /> },
      { path: 'wallet', element: <WalletPage /> },
      { path: 'purchases', element: <PurchasesPage /> },
      { path: 'my-orders', element: <MyOrdersPage /> },
      { path: 'favorites', element: <FavoritesPage /> },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
  {
    element: <AuthLayout />,
    children: [
      { path: '/login', element: <LoginPage /> },
      { path: '/signup', element: <SignupPage /> },
      { path: '/reset-password', element: <ResetPasswordPage /> },
      { path: '/new-password', element: <NewPasswordPage /> },
    ],
  },
]);
END
echo "export * from './router';" > src/app/router/index.js

cat > src/app/layouts/index.js << 'END'
export * from './main-layout';
export * from './auth-layout';
END

echo ""
echo "ALL DONE"
echo ""
echo "=== ПРОВЕРКА ПУСТЫХ ПАПОК ==="
find src -type d -empty
echo ""
